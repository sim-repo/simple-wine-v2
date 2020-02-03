import Foundation


class AuthPresenter {
    
    private init(){}
    static var shared = AuthPresenter()
    
    var point: Point!
    var view: PresentableAuthView?
    
    func setup(point: Point) {
        self.point = point
    }
}


extension AuthPresenter: ViewableAuthPresenter {

    func setView(view: PresentableAuthView) {
        self.view = view
    }
    
    
    func getLogoImageURL() -> String {
        return point.logoOnLightImageURL
    }
    
    
    func didPressSignIn(login: String, password: String) {
        //TODO check login
        view?.enter()
    }
}
