import Foundation


class CoverPresenter {
    
    private init() {}
    
    static var shared = CoverPresenter()
    
    var view: PresentableCoverView?
    var point: Point?
    
}


extension CoverPresenter: ViewableCoverPresenter {
    
    func setView(view: PresentableCoverView) {
        self.view = view
    }
    
    func getPointEnum() -> PointEnum {
        return point!.id
    }
    
    func didPressEnter() {
        view?.enter()
    }
    
    func didLogout() {
        view?.logout()
        Setter.shared.coverDidLogout()
    }
}

extension CoverPresenter: SetterableCoverPresenter {
    func setCurrentPoint(point: Point) {
        self.point = point
    }
}
