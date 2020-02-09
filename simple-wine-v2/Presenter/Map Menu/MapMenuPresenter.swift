import Foundation


//# >> проект: тупые менеджера

class MapMenuPresenter {
    
    private init(){}
    static var shared = MapMenuPresenter()
    
    var point: Point!
    
    var view: PresentableMapMenuView?
}


extension MapMenuPresenter: ViewableMapMenuPresenter {
    
    
    func setView(view: PresentableMapMenuView) {
        self.view = view
    }
    
    func getLogoImageURL() -> String {
        return point.logoOnLightImageURL
    }
    
    func didPressClassicMenuItem() {
        MapPresenter.shared.setup(menuMapEnum: .classic)
        view?.enter()
    }
    
    func didPressPriceMenuItem() {
        MapPresenter.shared.setup(menuMapEnum: .price)
        view?.enter()
    }
}


extension MapMenuPresenter: SetterableMapMenuPresenter {
    
    func setCurrentPoint(point: Point) {
        self.point = point
    }
}
