import Foundation


class PointMenuPresenter {
    
    private init(){}
    
    static var shared = PointMenuPresenter()
    
    var view: PresentablePointMenuView?
    var points: [Point]?
    var selectedPoint: Point?
    
    func setup(_ points: [Point]) {
        self.points = points
    }
}


extension PointMenuPresenter: ViewablePointMenuPresenter {
    
    func setView(view: PresentablePointMenuView) {
        self.view = view
    }
    
    func didPressEnter(pointEnum: PointEnum) {

        if points == nil {
            Setter.shared.allSync(by: pointEnum) { [weak self] in
                guard let self = self else { return }
                self.view?.enter()
            }
        } else {
            Setter.shared.allSync(by: pointEnum)
            let point = points!.first(where: {$0.id == pointEnum})!
            AuthPresenter.shared.setup(point: point)
            view?.enter()
        }
    }
}
