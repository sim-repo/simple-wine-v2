import UIKit


class Setter {
    
    private init(){}
    static var shared = Setter()

    
//MARK:- on success
    private func getOnSuccess(_ completion: (()->Void)? = nil ) -> setterOnSuccess {
        let completion: setterOnSuccess = { points in
            // point menu
            (PointMenuPresenter.shared as SetterablePointMenuPresenter).setup(points)
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
        AllSync.shared.sync(getOnSuccess(completion), getOnError())
    }
    
    func bkgAllSync(appCompletion: ((_ newData: Bool) -> Void)? = nil) {
        BkgAllSync.shared.sync(getOnSuccess(), getBkgOnError(appCompletion), appCompletion)
    }
}


//MARK:- point has being selected
extension Setter {
    
    func pointMenuDidSelect(point: Point, _ completion: (()->Void)? = nil) {
        
        // 1 подгружаем из realm
        let categories = RealmService.loadCategories(pointEnum: point.id)
        let filters = RealmService.loadFilters(pointEnum: point.id)
        let products = RealmService.loadProducts(pointEnum: point.id)
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
            (PointMenuPresenter.shared as SetterablePointMenuPresenter).showAlert(text: "Нет данных по \(point.name).\nПроверьте интернет-соединение или обратитесь к службе поддержки" )
        }
        
        // 4 сетапим точку в другие презентеры
        (AuthPresenter.shared as SetterableAuthPresenter).setCurrentPoint(point: point)
        (MapMenuPresenter.shared as SetterableMapMenuPresenter).setCurrentPoint(point: point)
        (MapPresenter.shared as SetterableMapPresenter).setCurrentPoint(pointEnum: point.id)
        
        // 5 вызываем segue transition
        completion?()
    }
}
