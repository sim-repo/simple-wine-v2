import UIKit
import Kingfisher

class FavouriteDetailViewController: UIViewController {
    
    @IBOutlet weak var bkgView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var originalNameLabel: UILabel!
    @IBOutlet weak var russianNameLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var colorImageView: UIImageView!
    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var grapesLabel: UILabel!
    @IBOutlet weak var sugarLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    var product: Product?

    override func viewDidLoad() {
        super.viewDidLoad()
        bkgView.backgroundColor = .clear
        
        setCloseButton()
        guard let product = product else { return }
        
        let url = URL(string: product.imageURL)
        imageView.kf.setImage(with: url)
    
        originalNameLabel.text = product.name + ", \(product.volume) Л"
        russianNameLabel.text = product.nameRU
        
        setupColor(product: product)
        setupGrapes(product: product)
        setupSugar(product: product)
        setupCountry(product: product)
        setupPrice(product: product)
    }
    
    
    func setup(presenter: ViewableDetailFavouritePresenter) {
        product = presenter.getProduct()
    }
    
    
    private func setupColor(product: Product){
        switch product.color {
        case .red:
            colorImageView.image = UIImage(named: "RedColor")
            colorLabel.text = "красное"
        case .pink:
            colorImageView.image = UIImage(named: "PinkColor")
            colorLabel.text = "розовое"
        case .white:
            colorImageView.image = UIImage(named: "WhiteColor")
            colorLabel.text = "белое"
        default:
            break
        }
        colorLabel.textColor = Theme.unselected
        colorLabel.font = Theme.geometriaLight(ofSize: 17)
    }
    
    private func setupGrapes(product: Product) {
        grapesLabel.text = product.grapes
        grapesLabel.textColor = Theme.unselected
        grapesLabel.font = Theme.geometriaLight(ofSize: 17)
    }
    
    private func setupSugar(product: Product) {
        sugarLabel.text = product.sugar.rawValue
        sugarLabel.textColor = Theme.unselected
        sugarLabel.font = Theme.geometriaLight(ofSize: 17)
    }
    
    private func setupCountry(product: Product) {
        countryLabel.text = product.country
        countryLabel.textColor = Theme.unselected
        countryLabel.font = Theme.geometriaLight(ofSize: 17)
        let url = URL(string: product.countryIconURL)
        countryImageView.kf.setImage(with: url)
    }
    
    private func setupPrice(product: Product) {
        let formattedPrice =  Formatter.priceFormat(price: NSNumber(value: Int(product.price)), localeIdentifier: "ru_RU")
        priceLabel.text = formattedPrice
    }

    
    @IBAction func pressClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    private func setCloseButton(){
        closeButton.setImage(UIImage(named: "RedCrossButton"), for: .normal)
    }
}
