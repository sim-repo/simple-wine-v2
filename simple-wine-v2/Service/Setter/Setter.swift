import Foundation


class Setter {
    
    private init(){}
    static var shared = Setter()
    
    
    var currentPointEnum: PointEnum = .unknown
    
    
    // on success
    private func getOnSuccess(_ pointEnum: PointEnum, _ completion: (()->Void)? = nil ) -> setterOnSuccess {
        
        let completion: setterOnSuccess = { points, categories, filters, products, detailMapSettings in
                              
            PointMenuPresenter.shared.setup(points)
            
            guard let point = points.first(where: {$0.id == pointEnum}) else { return }
            AuthPresenter.shared.setup(point: point)
            
            (MapPresenter.shared as SyncableMapPresenter).setAllDataSources(
                pointEnum: pointEnum,
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
            print(error)
        }
        return completion
    }
    

    
    func allSync(by pointEnum: PointEnum, _ completion: (()->Void)? = nil) {
        currentPointEnum = pointEnum
        AllSync.shared.syncFilter(by: pointEnum, getOnSuccess(pointEnum, completion), getOnError())
    }
}



//MARK:- Points

extension Setter {
    
    // on success
    private func getOnSuccess_Points() -> setterOnSuccess_Points {
        
        let completion: setterOnSuccess_Points = { points in
            PointMenuPresenter.shared.setup(points)
        }
        return completion
    }
    
    
    func pointsSync() {
        PointsSync.shared.sync(getOnSuccess_Points() , getOnError())
    }
}
