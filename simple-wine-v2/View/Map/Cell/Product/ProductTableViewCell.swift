import UIKit

class ProductTableViewCell: UITableViewCell {


    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var indexPath: IndexPath!
    var presenter: ViewableProductPresenter?
    
    func setup(_ product: Product, presenter: ViewableProductPresenter, indexPath: IndexPath) {
        itemImageView.image = UIImage(named: product.imageURL)
        titleLabel.text = product.name
        textView.text = product.desc
        self.indexPath = indexPath
        self.presenter = presenter
    }
    
    @IBAction func doPressDetail(_ sender: Any) {
        presenter?.productDidPressDetail(indexPath: indexPath)
    }
}
