import UIKit
import Kingfisher


class MapDetailViewController: UIViewController {

    @IBOutlet var bkgView: UIView!
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
        bkgView.backgroundColor = Theme.bkgMapDetail
        guard let presenter = presenter else { return }
        guard let product = presenter.getProduct() else { return }
        isLike = product.isLiked
        setCloseButton()
        setLikeButton(isLiked: product.isLiked)
        
        let url = URL(string: product.imageURL)
        imageView.kf.setImage(with: url)
        
        originalNameLabel.text = product.name + ", \(product.manufactureYear)г."
        russianNameLabel.text = product.name
        attributesLabel.text = presenter.getAttribute()
       // bigDescLabel.text = product.bigDesc
        bigDescLabel.text = "Вино — один из самых благородных и многогранных напитков в мире. В интернет-витрине SimpleWine представлена одна из лучших коллекций тихих и игристых вин со всего света: популярные крупные бренды, преимущественно семейные, вина от бутиковых хозяйств с небольшими объемами производства, культовые и особо ценные экземпляры Simple Collection, специально отобранные нашими экспертами, а также органика, биодинамика и вина с сертификатами sustainable, собранные в отдельном разделе Green Selection."
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
