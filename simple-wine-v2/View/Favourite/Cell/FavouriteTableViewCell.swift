import UIKit


class FavouriteTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    func setup(product: Product) {
        productNameLabel.text = product.name
        productPriceLabel.text = "\(product.price)"
    }
}
