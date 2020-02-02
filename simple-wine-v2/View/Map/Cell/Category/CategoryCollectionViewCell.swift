import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func setup(_ category: Category, selected: Bool) {
        titleLabel.text = category.title
        titleLabel.alpha = selected ? 1 : 0.8
    }
}
