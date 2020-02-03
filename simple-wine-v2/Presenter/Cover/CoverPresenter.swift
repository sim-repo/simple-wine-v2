import Foundation


class CoverPresenter {
    
    private init() {}
    
    static var shared = CoverPresenter()
    
    var view: PresentableCoverView?
    var point: Point?
    
    func setup(point: Point) {
        self.point = point
    }
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
    }
}
