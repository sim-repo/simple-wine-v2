import Foundation


class PointMenuPresenter {
    
    private init(){
        // fill points from sync
        points = Point.list()
    }
    
    static var shared = PointMenuPresenter()
    
    var view: PresentablePointMenuView?
    var points: [Point]
    var selectedPoint: Point?
}


extension PointMenuPresenter: ViewablePointMenuPresenter {
    
    func setView(view: PresentablePointMenuView) {
        self.view = view
    }
    
    func didPressEnter(pointEnum: PointEnum) {
        selectedPoint = points.first(where: {$0.id == pointEnum})
        
        MapPresenter.shared.preload(pointEnum: pointEnum)
        
        AuthPresenter.shared.setup(point: selectedPoint!)
        view?.enter()
    }
}
