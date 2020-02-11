import Foundation


//MARK:- Map
protocol SetterableMapPresenter {
    
    func setAllDataSources(categories: [Category],
                           filters: [Filter],
                           products: [Product],
                           detailMapSettings: [DetailMapSetting])
    
    func setCurrentPoint(pointEnum: PointEnum)
    func setMapMenu(menuMapEnum: MenuMapEnum)
    func clear()
    func favouritesClear()
}

//MARK:- Point Menu

protocol SetterablePointMenuPresenter {
    func setup(_ points: [Point])
    func startWaitIndicator()
    func stopWaitIndicator()
    func showAlert(text: String)
    func showAuth()
}


//MARK:- Auth

protocol SetterableAuthPresenter {
    func setCurrentPoint(point: Point)
}


protocol SetterableCoverPresenter {
    func setCurrentPoint(point: Point)
}

//MARK:- Map Menu

protocol SetterableMapMenuPresenter {
    func setCurrentPoint(point: Point)
    func showAlert(text: String)
    func showActionAlert(text: String, completion: (()->Void)?)
}
