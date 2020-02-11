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
    
    func didPressEnter(menuMapEnum: MenuMapEnum) {
        Setter.shared.mapMenuDidSelect(point: point, mapMenuEnum: menuMapEnum) { [weak self] in
            guard let self = self else { return }
            self.view?.enter()
        }
    }
}


extension MapMenuPresenter: SetterableMapMenuPresenter {
    
    func setCurrentPoint(point: Point) {
        self.point = point
    }
    
    func showAlert(text: String) {
        view?.showAlert(text: text)
    }
}
