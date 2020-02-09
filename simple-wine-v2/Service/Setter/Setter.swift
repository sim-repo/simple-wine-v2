import UIKit


class Setter {
    
    private init(){}
    static var shared = Setter()

    // on success
    private func getOnSuccess(_ completion: (()->Void)? = nil ) -> setterOnSuccess {
        
        let completion: setterOnSuccess = { points, categories, filters, products, detailMapSettings in
                     
            // point menu
            (PointMenuPresenter.shared as SetterablePointMenuPresenter).setup(points)
            
            // map
            (MapPresenter.shared as SetterableMapPresenter).setAllDataSources(
                categories: categories,
                filters: filters,
                products: products,
                detailMapSettings: detailMapSettings
            )
            completion?()
        }
        return completion
    }
    
    
    // on error
    private func getOnError() -> setterOnError {
        let completion: setterOnError = { error in
            (PointMenuPresenter.shared as SetterablePointMenuPresenter).stopWaitIndicator()
            (PointMenuPresenter.shared as SetterablePointMenuPresenter).showAlert(text: error )
        }
        return completion
    }
    
    // on error
    private func getBkgOnError(_ appCompletion: ((_ newData: Bool) -> Void)? = nil) -> setterOnError {
        let completion: setterOnError = { error in
            appCompletion?(false)
        }
        return completion
    }

    
    
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
        (AuthPresenter.shared as SetterableAuthPresenter).setCurrentPoint(point: point)
        (MapMenuPresenter.shared as SetterableMapMenuPresenter).setCurrentPoint(point: point)
        (MapPresenter.shared as SetterableMapPresenter).setCurrentPoint(pointEnum: point.id)
        completion?()
    }
}
