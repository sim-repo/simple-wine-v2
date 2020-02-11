import UIKit
import Kingfisher

class AuthViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var loginLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var presenter: ViewableAuthPresenter {
        AuthPresenter.shared.setView(view: self)
        return AuthPresenter.shared
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeKeyboard()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeKeyboard()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginLabel.becomeFirstResponder()
        setButtons()
        setLogo()
        setDefaultPassword()
        addKeyboardGesture()
    }
    
    private func setButtons(){
        enterButton.setImage(UIImage(named: "RightArrowButton"), for: .normal)
    }
    
    private func setLogo(){
        if let imageURL = presenter.getLogoImageURL() {
            logoImageView.kf.setImage(with: URL(string: imageURL))
        }
    }
    
    // temporary
    private func setDefaultPassword() {
        loginLabel.text = "kuznetsky.test@simplewine.ru1"
        passwordLabel.text = "4fp1AoQ8@wUX"
    }
    
    @IBAction func pressSignIn(_ sender: Any) {
        guard loginLabel.text != "" && passwordLabel.text != "" else { return }
        presenter.didPressSignIn(login: loginLabel.text!, password: passwordLabel.text!)
    }
}


//MARK:- PresentableAuthView
extension AuthViewController: PresentableAuthView {
    func enter() {
        navigationController?.popViewController(animated: true)
    }
}


//MARK:- Keyboard
extension AuthViewController {
    
    private func subscribeKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    private func unsubscribeKeyboard(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func addKeyboardGesture(){
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height + 60, right: 0.0)
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
}
