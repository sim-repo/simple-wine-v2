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
        Setter.shared.authSignInDidSelect(login: login, password: password) { [weak self] in
            guard let self = self else { return }
            CoverPresenter.shared.setup(point: self.point)
            self.view?.enter()
        }
    }
}

//MARK:- Setterable
extension AuthPresenter: SetterableAuthPresenter {
    
    func setCurrentPoint(point: Point) {
        self.point = point
    }
}
