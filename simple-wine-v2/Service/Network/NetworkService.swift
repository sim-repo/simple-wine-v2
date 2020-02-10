import Foundation


struct NetworkService {
    
    static var runningTask: [TaskEnum:Retry] = [:]

    enum TaskEnum {
        case all
    }
    
    class Retry {
        var dispatchGroup: DispatchGroup?
        var task: (() -> Void)?
        var tryCount = 0
        var onError: setterOnError
        
        internal init(dispatchGroup: DispatchGroup?, task: (() -> Void)?, onError: setterOnError) {
            self.dispatchGroup = dispatchGroup
            self.task = task
            self.onError = onError
        }
    }
    
    
    static func tryAgain(taskEnum: TaskEnum, err: String){
        guard let trying = runningTask[taskEnum] else { return }
        trying.dispatchGroup?.leave()
        guard trying.tryCount < NetworkConfiguration.maxRetryNumber
            else {
                requestDidFinish(taskEnum: taskEnum)
                trying.onError?(err)
                return
        }
        
        DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(NetworkConfiguration.waitForNextTrying), qos: .userInteractive) {
            trying.tryCount += 1
            trying.dispatchGroup?.enter()
            trying.task?()
        }
     }
    
    
    static func requestDidFinish(taskEnum: TaskEnum){
        runningTask[taskEnum] = nil
    }
    
    
    static func runner(taskEnum: TaskEnum, task: (() -> Void)?, onError: setterOnError, dispatchGroup: DispatchGroup) {
        guard runningTask[TaskEnum.all] == nil else { return }
        let trying = Retry(dispatchGroup: dispatchGroup, task: task, onError: onError)
        runningTask[TaskEnum.all] = trying
        trying.dispatchGroup?.enter()
        task?()
    }
}




//MARK:- Requests

extension NetworkService {
    
    public static func requestAll(_ request: URLRequest,
                                         _ onSuccess: setterOnSuccess,
                                         _ onError: setterOnError,
                                         _ syncOnSuccess: syncOnSuccess) {
        
        let dispatchGroup = DispatchGroup()
        
        let task = {
            session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                tryAgain(taskEnum: .all, err: error.localizedDescription)
                return
            }
            guard let data = data,
                data.isEmpty == false
            else {
                tryAgain(taskEnum: .all, err: "data is empty")
                return
            }
            guard let resp = ParseService.decodeAll(data: data, onError) else { return }
                
            dispatchGroup.leave()
            // TODO: add threads
            requestDidFinish(taskEnum: .all)
            onSuccess?(resp.points)
            syncOnSuccess?(resp.points, resp.categories, resp.filters, resp.products, resp.detailMapSetting)
            }.resume()
        }
        runner(taskEnum: .all, task: task, onError: onError, dispatchGroup: dispatchGroup)
    }
}
