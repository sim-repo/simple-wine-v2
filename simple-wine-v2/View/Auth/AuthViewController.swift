import UIKit


class AuthViewController: UIViewController{
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var loginLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    var presenter: ViewableAuthPresenter {
        AuthPresenter.shared.setView(view: self)
        return AuthPresenter.shared
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setEnterButton()
        setLogo()
    }
    
    private func setEnterButton(){
        let image = getSystemImage(name: "arrow.right.circle", pointSize: 20, color: #colorLiteral(red: 0.7646576762, green: 0.764711082, blue: 0.7689109445, alpha: 1))
        enterButton.setImage(image, for: .normal)
    }
    
    private func setLogo(){
        logoImageView.image = UIImage(named: presenter.getLogoImageURL())
    }
    
    @IBAction func pressSignIn(_ sender: Any) {
        guard loginLabel.text != "" && passwordLabel.text != "" else { return }
        presenter.didPressSignIn(login: loginLabel.text!, password: passwordLabel.text!)
    }
}


extension AuthViewController: PresentableAuthView {
    func enter() {
        performSegue(withIdentifier: "showCoverSegue", sender: nil)
    }
}
