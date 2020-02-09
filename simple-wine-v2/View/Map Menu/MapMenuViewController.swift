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
        presenter.didPressClassicMenuItem()
    }
    
    @IBAction func pressPrice(_ sender: Any) {
        presenter.didPressPriceMenuItem()
    }
    
    @IBAction func pressBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}


extension MapMenuViewController: PresentableMapMenuView {
    
    func enter() {
        performSegue(withIdentifier: "showMapSegue", sender: nil)
    }
}
