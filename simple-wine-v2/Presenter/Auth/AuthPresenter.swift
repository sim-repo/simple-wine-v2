import Foundation


class AuthPresenter {
    
    private init(){}
    static var shared = AuthPresenter()
    
    var point: Point!
    var view: PresentableAuthView?
}


//MARK:- Viewable
extension AuthPresenter: ViewableAuthPresenter {
    
    func setView(view: PresentableAuthView) {
        self.view = view
    }
    
    
    func getLogoImageURL() -> String {
        return point.logoOnLightImageURL
    }
    
    
    func didPressSignIn(login: String, password: String) {
        //TODO check login
        CoverPresenter.shared.setup(point: point)
        view?.enter()
    }
}

//MARK:- Setterable
extension AuthPresenter: SetterableAuthPresenter {
    
    func setCurrentPoint(point: Point) {
        self.point = point
    }
}
