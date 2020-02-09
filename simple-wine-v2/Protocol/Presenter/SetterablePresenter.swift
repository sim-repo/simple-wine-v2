import Foundation


//MARK:- Map
protocol SetterableMapPresenter {
    
    func setAllDataSources(categories: [Category],
                           filters: [Filter],
                           products: [Product],
                           detailMapSettings: [DetailMapSetting])
    
    
    
    func setCategoryDataSource(categories: [Category])
    func setFilterDataSource(filters: [Filter])
    func setProductDataSource(products: [Product])
    func setCurrentPoint(pointEnum: PointEnum)
}

//MARK:- Point Menu

protocol SetterablePointMenuPresenter {
    func setup(_ points: [Point])
    func startWaitIndicator()
    func stopWaitIndicator()
    func showAlert(text: String)
}


//MARK:- Auth

protocol SetterableAuthPresenter {
    func setCurrentPoint(point: Point)
}


//MARK:- Auth

protocol SetterableMapMenuPresenter {
    func setCurrentPoint(point: Point)
}
