import UIKit



class MapDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var originalNameLabel: UILabel!
    @IBOutlet weak var russianNameLabel: UILabel!
    
    @IBOutlet weak var attributesLabel: UILabel!
    @IBOutlet weak var bigDescLabel: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    
    var presenter: ViewableDetailMapPresenter?
    var isLike = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let presenter = presenter else { return }
        guard let product = presenter.getProduct() else { return }
        isLike = product.isLiked
        setCloseButton()
        setLikeButton(isLiked: product.isLiked)
        imageView.image = UIImage(named: product.imageURL)
        originalNameLabel.text = product.name + ", \(product.manufactureYear)г."
        russianNameLabel.text = product.name
        attributesLabel.text = presenter.getAttribute()
        bigDescLabel.text = product.bigDesc
    }
    
    private func setCloseButton(){
        let image = getSystemImage(name: "xmark.octagon", pointSize: 20, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        closeButton.setImage(image, for: .normal)
    }
    
    private func setLikeButton(isLiked: Bool) {
        let image = getSystemImage(name: "heart", pointSize: 20, color:  isLiked ? #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) : #colorLiteral(red: 0.7517493367, green: 0.7518768311, blue: 0.751732409, alpha: 1) )
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
