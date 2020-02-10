import Foundation


//MARK:- Map
protocol SetterableMapPresenter {
    
    func setAllDataSources(categories: [Category],
                           filters: [Filter],
                           products: [Product],
                           detailMapSettings: [DetailMapSetting])
    
    func setCurrentPoint(pointEnum: PointEnum)
    
    func clear()
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
