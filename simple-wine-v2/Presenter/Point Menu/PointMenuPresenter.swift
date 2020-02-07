import Foundation


class PointMenuPresenter {
    
    private init(){}
    
    static var shared = PointMenuPresenter()
    
    var view: PresentablePointMenuView?
    var points: [Point]? {
        didSet {
            stopWaitIndicator()
        }
    }
    var selectedPoint: Point?
}


//MARK:- Viewable
extension PointMenuPresenter: ViewablePointMenuPresenter {
    
    func setView(view: PresentablePointMenuView) {
        self.view = view
        if points == nil {
            startWaitIndicator()
        }
    }
    
    func didPressEnter(pointEnum: PointEnum) {
        let point = points!.first(where: {$0.id == pointEnum})!
        Setter.shared.pointMenuDidSelect(point: point) { [weak self] in
            guard let self = self else { return }
            self.view?.enter()
        }
    }
}

//MARK:- Setterable
extension PointMenuPresenter: SetterablePointMenuPresenter {
    
    func setup(_ points: [Point]) {
        self.points = points
    }
    
    func startWaitIndicator() {
        ThreadConstant.UI_THREAD {[weak self] in
            guard let self = self else { return }
            self.view?.startWaitIndicator()
        }
    }
    
    func stopWaitIndicator() {
        ThreadConstant.UI_THREAD {[weak self] in
            guard let self = self else { return }
            self.view?.stopWaitIndicator()
        }
    }
    
    func showAlert(text: String) {
        view?.showAlert(text: text)
    }
}
