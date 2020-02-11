import UIKit


class Setter {
    
    private init(){}
    static var shared = Setter()

    var deviceId: String = ""
    var login: Login?
    
//MARK:- on success
    private func getOnSuccess(_ completion: (()->Void)? = nil ) -> setterOnSuccess {
        let completion: setterOnSuccess = { points in
            // point menu
            (PointMenuPresenter.shared as SetterablePointMenuPresenter).setup(points)
            completion?()
        }
        return completion
    }
    
    
    private func getSysDeviceOnSuccess() -> setterSystemDeviceOnSuccess {
        let completion: setterSystemDeviceOnSuccess = { deviceId in
            self.deviceId = deviceId
        }
        return completion
    }
    
    private func getLoginOnSuccess(_ completion: (()->Void)? = nil) -> setterLoginOnSuccess {
        let completion: setterLoginOnSuccess = { login in
            self.login = login
            completion?()
        }
        return completion
    }
    
    
    
    
//MARK:- on error
    private func getOnError() -> setterOnError {
        let completion: setterOnError = { error in
            (PointMenuPresenter.shared as SetterablePointMenuPresenter).stopWaitIndicator()
            (PointMenuPresenter.shared as SetterablePointMenuPresenter).showAlert(text: error )
        }
        return completion
    }
    
    private func getBkgOnError(_ appCompletion: ((_ newData: Bool) -> Void)? = nil) -> setterOnError {
        let completion: setterOnError = { error in
            appCompletion?(false)
        }
        return completion
    }

    
//MARK:- sync functions
    
    func allSync(_ completion: (()->Void)? = nil) {
        AllSync.shared.sync(self.getOnSuccess(completion), self.getOnError())
    }
    
    func bkgAllSync(appCompletion: ((_ newData: Bool) -> Void)? = nil) {
        BkgAllSync.shared.sync(getOnSuccess(), getBkgOnError(appCompletion), appCompletion)
    }
    
    func sysDeviceSync() {
        SysDeviceSync.shared.sync(getSysDeviceOnSuccess(), getOnError())
    }
    
    func loginSync(userId: String, password: String, _ completion: (()->Void)? = nil) {
        LoginSync.shared.sync(deviceId: deviceId, userId: userId, password: password, getLoginOnSuccess(completion), getOnError())
    }
}


extension Setter: DownloadableSetter {
    
    func downloadDidFinish() {
        ThreadConstant.UI_THREAD {
            (PointMenuPresenter.shared.view as! PointMenuViewController).downloadDidFinish()
        }
    }
    
    func downloadUpdateProgress(progress: Float, totalSize : String) {
        ThreadConstant.UI_THREAD {
            (PointMenuPresenter.shared.view as! PointMenuViewController).downloadUpdateProgress(progress: progress, totalSize: totalSize)
        }
    }
}


//MARK:- presentable
extension Setter {
    
    
    func pointMenuDidSelect(point: Point, _ completion: (()->Void)? = nil) {
        (AuthPresenter.shared as SetterableAuthPresenter).setCurrentPoint(point: point)
        (MapMenuPresenter.shared as SetterableMapMenuPresenter).setCurrentPoint(point: point)
        
        (MapPresenter.shared as SetterableMapPresenter).favouritesClear()
        completion?()
    }
    
    
    func authSignInDidSelect(login: String, password: String, _ completion: (()->Void)? = nil ) {
        loginSync(userId: login, password: password, completion)
    }
    
    
    func mapMenuDidSelect(point: Point, mapMenuEnum: MenuMapEnum, _ completion: (()->Void)? = nil) {
        
        // 1 сетапим точку в другие презентеры
        (MapPresenter.shared as SetterableMapPresenter).setCurrentPoint(pointEnum: point.id)
        (MapPresenter.shared as SetterableMapPresenter).setMapMenu(menuMapEnum: mapMenuEnum)
        
        
        // 1 подгружаем из realm
        let categories = RealmService.loadCategories(pointEnum: point.id, menuMapEnum: mapMenuEnum)
        let filters = RealmService.loadFilters(pointEnum: point.id, menuMapEnum: mapMenuEnum)
        let products = RealmService.loadProducts(pointEnum: point.id, menuMapEnum: mapMenuEnum)
        let settings = RealmService.loadDetailMapSettings()
        
        // 2 очищаем кэш от старых данных
        (MapPresenter.shared as SetterableMapPresenter).clear()
        
        // 3 сетапим данные в map presenter
        if categories?.isEmpty == false,
        filters?.isEmpty == false,
        products?.isEmpty == false,
        settings?.isEmpty == false {
            (MapPresenter.shared as SetterableMapPresenter).setAllDataSources(
                categories: categories!,
                filters: filters!,
                products: products!,
                detailMapSettings: settings!
            )
        } else {
            (MapMenuPresenter.shared as SetterableMapMenuPresenter).showAlert(text: "Нет данных по \(point.name) : \(mapMenuEnum.rawValue).\nПроверьте интернет-соединение или обратитесь к службе поддержки" )
            return
        }
        
        // 5 вызываем segue transition
        completion?()
    }
    
    
    
    
    
    
}
