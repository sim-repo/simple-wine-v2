import UIKit


class Setter {
    
    private init(){}
    static var shared = Setter()

    var deviceId: String = ""
    var tokenId: String = ""

//MARK:- on success
    private func getOnSuccess(_ completion: (()->Void)? = nil ) -> setterOnSuccess {
        let completion: setterOnSuccess = { points in
            (PointMenuPresenter.shared as SetterablePointMenuPresenter).setup(points)
            completion?()
        }
        return completion
    }
    
    
    private func getSysDeviceOnSuccess() -> setterSystemDeviceOnSuccess {
        let completion: setterSystemDeviceOnSuccess = { deviceId in
            self.deviceId = deviceId
            (PointMenuPresenter.shared as SetterablePointMenuPresenter).showAuth()
        }
        return completion
    }
    
    
    private func getLoginOnSuccess(_ completion: (()->Void)? = nil) -> setterLoginOnSuccess {
        let completion: setterLoginOnSuccess = { login in
            completion?()
            self.tokenId = login.token
            self.allSync(force: false)
        }
        return completion
    }
    
    
    private func getTokenOnSuccess(_ completion: (()->Void)? = nil) -> setterTokenOnSuccess {
        let completion: setterTokenOnSuccess = { success in
            if success {
                completion?()
                self.allSync(force: false)
            }
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
    
    
    private func getTokenOnError() -> setterTokenOnError {
        let completion: setterTokenOnError = {
            (PointMenuPresenter.shared as SetterablePointMenuPresenter).showAuth()
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
    
    func allSync(force: Bool, _ completion: (()->Void)? = nil) {
        AllSync.shared.sync(self.getOnSuccess(completion), self.getOnError(), force: force)
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
    
    func tokenSync(_ completion: (()->Void)? = nil) {
        if let login = RealmService.loadLogin(),
            login.deviceId != "",
            login.password != "",
            login.userId != "",
            login.token != "" {
            TokenSync.shared.sync(deviceId: login.deviceId, tokenId: login.token, getTokenOnSuccess(completion), getTokenOnError(), getOnError())
        } else {
            sysDeviceSync()
        }
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
        (CoverPresenter.shared as SetterableCoverPresenter).setCurrentPoint(point: point)
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
            (MapMenuPresenter.shared as SetterableMapMenuPresenter).showActionAlert(text: "Нет данных по \(point.name) : \(mapMenuEnum.rawValue).\nНажимте OK, чтобы попытаться скачать данные.\nВ случае неудачи обратитесь к службе поддержки") {
                self.allSync(force: true)
            }
            return
        }
        
        // 5 вызываем segue transition
        completion?()
    }
    
    func coverDidLogout() {
        tokenId = ""
        RealmService.clearLogin()
        (PointMenuPresenter.shared as SetterablePointMenuPresenter).showAuth()
    }
}
