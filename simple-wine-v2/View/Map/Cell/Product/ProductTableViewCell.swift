import UIKit

class ProductTableViewCell: UITableViewCell {


    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var likeButton: UIButton!
    
    var indexPath: IndexPath!
    var presenter: ViewableProductPresenter?
    var isLike = false
    var product: Product?
    
    func setup(_ product: Product, presenter: ViewableProductPresenter, indexPath: IndexPath) {
        itemImageView.image = UIImage(named: product.imageURL)
        titleLabel.text = product.name
        textView.text = product.desc
        self.indexPath = indexPath
        self.presenter = presenter
        isLike = product.isLiked
        self.product = product
        setLikeButton(isLiked: product.isLiked)
    }
    
    @IBAction func doPressDetail(_ sender: Any) {
        presenter?.productDidPressDetail(indexPath: indexPath)
    }
    
    @IBAction func doPressLike(_ sender: Any) {
        isLike = !isLike
        setLikeButton(isLiked: isLike)
        (presenter as? DetailMapPresenterDelegate)?.favouriteDidPressLike(product: product!, isLike: isLike)
    }
    
    private func setLikeButton(isLiked: Bool) {
        let image = getSystemImage(name: "heart", pointSize: 12, color:  isLiked ? #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1) : #colorLiteral(red: 0.7517493367, green: 0.7518768311, blue: 0.751732409, alpha: 1) )
        likeButton.setImage(image, for: .normal)
    }
}
