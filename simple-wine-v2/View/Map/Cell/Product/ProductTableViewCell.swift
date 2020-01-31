import UIKit

class ProductTableViewCell: UITableViewCell {


    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    
    func setup(_ product: Product) {
        itemImageView.image = UIImage(named: "wine")
        titleLabel.text = product.name
        textView.text = product.desc
    }
}
