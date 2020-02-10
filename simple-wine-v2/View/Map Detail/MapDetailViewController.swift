import UIKit
import Kingfisher


class MapDetailViewController: UIViewController {

    @IBOutlet var bkgView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var originalNameLabel: UILabel!
    @IBOutlet weak var russianNameLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var colorImageView: UIImageView!
    @IBOutlet weak var countryImageView: UIImageView!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var grapesLabel: UILabel!
    @IBOutlet weak var sugarLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    

    
    var presenter: ViewableDetailMapPresenter?
    var isLike = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bkgView.backgroundColor = Theme.bkgMapDetail
        guard let presenter = presenter else { return }
        guard let product = presenter.getProduct() else { return }
        isLike = product.isLiked
        setCloseButton()
        setLikeButton(isLiked: product.isLiked)
        
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
    
    
    
    private func setCloseButton(){
        closeButton.setImage(UIImage(named: "RedCrossButton"), for: .normal)
    }
    
    private func setLikeButton(isLiked: Bool) {
        let image = UIImage(named: isLiked ? "LikeButton" : "DislikeButton")
        likeButton.setImage(image, for: .normal)
    }
    
    func setup(presenter: ViewableDetailMapPresenter){
        self.presenter = presenter
        
    }
    
    @IBAction func pressClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pressLike(_ sender: Any) {
        isLike = !isLike
        setLikeButton(isLiked: isLike)
        presenter?.favouriteDidPressLike(isLike: isLike)
    }
}
