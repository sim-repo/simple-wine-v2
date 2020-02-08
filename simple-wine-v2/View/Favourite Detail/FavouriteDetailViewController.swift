import UIKit

class FavouriteDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var originalNameLabel: UILabel!
    @IBOutlet weak var russianNameLabel: UILabel!
    @IBOutlet weak var attributesLabel: UILabel!
    @IBOutlet weak var bigDescLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!

    
    var product: Product?
    var presenter: ViewableDetailFavouritePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCloseButton()
        guard let product = product, let presenter = presenter else { return }
        imageView.image = UIImage(named: product.imageURL)
        originalNameLabel.text = product.name + ", \(product.manufactureYear)г."
        russianNameLabel.text = product.name
        attributesLabel.text = presenter.getAttribute()
        bigDescLabel.text = product.bigDesc
    }
    
    func setup(presenter: ViewableDetailFavouritePresenter) {
        product = presenter.getProduct()
        self.presenter = presenter
    }
    
    
    @IBAction func pressClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    private func setCloseButton(){
        closeButton.setImage(UIImage(named: "RedCrossButton"), for: .normal)
    }
}
