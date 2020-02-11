import UIKit

class BkgAllSync {
    
    private init(){}
    static var shared = BkgAllSync()
    var appCompletion: ((_ newData: Bool) -> Void)?
    
    func sync(_ onSuccess: setterOnSuccess,
              _ onError: setterOnError,
              _ appCompletion: ((_ newData: Bool) -> Void)? = nil
    ) {
        
        MapPresenter.shared.bkgPopToRootView()
        
        let interval = Date().timeIntervalSince(getLastSyncDate() ?? Date.yesterday)
        
        if interval > FetchConfiguration.intervalBeforeUpdating {
            let url = NetworkConfiguration.getFullPath(path: "all2")
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            self.appCompletion = appCompletion
            NetworkService.requestAll(request, onSuccess, onError, self.getOnSuccess())
        }
    }
    
    private func log(_ msg: String, level: Logger.LogLevelEnum) {
        Logger.log(clazz: String(describing: self), msg, level: level, printEnum: .bkgSync)
    }
}


//MARK:- Persistence Support

extension BkgAllSync {
    
    // on success
    private func getOnSuccess() -> syncOnSuccess {
        
        let completion: syncOnSuccess = { [weak self] points, categories, filters, products, detailMapSettings in
            guard let self = self else { return }
            RealmService.clearAll(confEnum: .unsafe)
            RealmService.save(models: points, update: true)
            RealmService.save(models: categories, update: true)
            RealmService.save(models: filters, update: true)
            RealmService.save(models: products, update: true)
            RealmService.save(models: detailMapSettings, update: true)
            self.setLastSyncDate(date: Date())
            self.log("Обновление успешно завершено.", level: .info)
            
            ThreadConstant.UI_THREAD {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.postNotification("\(Date()) - Обновление успешно завершено.")
            }
            self.appCompletion?(true)
        }
        return completion
    }
}


//MARK:- SchedulableSync Support

extension BkgAllSync: SchedulableSync {
    
    func getLastSyncDate() -> Date? {
        return UserDefaults.standard.value(forKey: String(describing: AllSync.self)) as? Date
    }
    
    func setLastSyncDate(date: Date) {
        UserDefaults.standard.setValue(date, forKey: String(describing: AllSync.self))
    }
}
