import Foundation
import Alamofire


class AlamofireService {
    
    public static let sharedManager: SessionManager = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        config.timeoutIntervalForRequest = 40
        config.timeoutIntervalForResource = 40
        let manager = Alamofire.SessionManager(configuration: config)
        return manager
    }()
    
    
    
    public static func requestAllSync(_ urlPath: String,
                                      _ params: Parameters,
                                      _ onSuccess: setterOnSuccess,
                                      _ onError: setterOnError) {
        
        
        AlamofireService.sharedManager.request(urlPath, method: .get, parameters: params).responseJSON{ response in
            
            switch response.result {
            case .success( _):
                guard let resp = ParseService.decodeAll(data: response.data!) else { return }
                onSuccess?(resp.points, resp.categories, resp.filters, resp.products, resp.detailMapSetting)
            case .failure(let err):
                let error = err as NSError
                onError?(error.localizedDescription)
            }
        }
    }
    
    
    
    public static func requestPointsSync(_ urlPath: String,
                                         _ params: Parameters,
                                         _ onSuccess: setterOnSuccess_Points,
                                         _ onError: setterOnError) {
        
        AlamofireService.sharedManager.request(urlPath, method: .get, parameters: nil).responseJSON{ response in
            
            switch response.result {
            case .success( _):
                do {
                    let dictionary: [String:[Point]] = try JSONDecoder().decode([String:[Point]].self, from: response.data!)
                    let points = dictionary.flatMap{$0.value}
                    onSuccess?(points)
                } catch let err {
                    print(err)
                }
            case .failure(let err):
                let error = err as NSError
                print(error.localizedDescription)
            }
            
        }
    }
    
}
