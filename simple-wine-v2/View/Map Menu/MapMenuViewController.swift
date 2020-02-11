import UIKit
import Kingfisher


class MapMenuViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var classicTitleLabel: UILabel!
    @IBOutlet weak var classicDescLabel: UILabel!
    
    @IBOutlet weak var priceTitleLabel: UILabel!
    @IBOutlet weak var priceDescLabel: UILabel!
    
    var presenter: ViewableMapMenuPresenter {
        MapMenuPresenter.shared.setView(view: self)
        return MapMenuPresenter.shared
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLogo()
    }
    
    
    private func setLogo(){
        logoImageView.kf.setImage(with: URL(string: presenter.getLogoImageURL()))
    }
    
    
    @IBAction func pressClassic(_ sender: Any) {
        presenter.didPressEnter(menuMapEnum: .classic)
    }
    
    @IBAction func pressPrice(_ sender: Any) {
        presenter.didPressEnter(menuMapEnum: .price)
    }
    
    @IBAction func pressBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}


extension MapMenuViewController: PresentableMapMenuView {
    
    func enter() {
        performSegue(withIdentifier: "showMapSegue", sender: nil)
    }
    
    func showAlert(text: String) {
        ThreadConstant.UI_THREAD {
             let alert = UIAlertController(title: "Что-то пошло не так..",
                                                     message: text,
                                                     preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
