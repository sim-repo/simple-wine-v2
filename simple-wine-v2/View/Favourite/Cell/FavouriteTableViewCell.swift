import UIKit


class FavouriteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    func setup(product: Product) {
        productNameLabel.text = product.name
        setupPrice(product: product)
    }
    
    private func setupPrice(product: Product) {
        let formattedPrice =  Formatter.priceFormat(price: NSNumber(value: Int(product.price)), localeIdentifier: "ru_RU")
        productPriceLabel.text = formattedPrice
    }
}
