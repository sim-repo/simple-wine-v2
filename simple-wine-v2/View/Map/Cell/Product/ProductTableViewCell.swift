import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    var indexPath: IndexPath!
    var presenter: ViewableProductPresenter?
    var product: Product?
    
    func setup(_ product: Product, presenter: ViewableProductPresenter, indexPath: IndexPath) {
        titleLabel.text = product.name
        titleLabel.font = Theme.geometriaRegular(ofSize: 16)
        titleLabel.textColor = Theme.unselected
        
        priceLabel.text = "\(product.price) ₽"
        priceLabel.font = Theme.geometriaRegular(ofSize: 16)
        priceLabel.textColor = Theme.unselected
        
        
        yearLabel.text = "\(product.manufactureYear)"
        yearLabel.font = Theme.geometriaRegular(ofSize: 16)
        yearLabel.textColor = Theme.unselected

        
        self.indexPath = indexPath
        self.presenter = presenter
        self.product = product
    }
}
