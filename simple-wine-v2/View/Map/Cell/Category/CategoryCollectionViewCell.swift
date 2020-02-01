import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var highlight: UIView!
    
    func setup(_ category: Category, selected: Bool) {
        imageView.image = UIImage(named: category.imageURL)
        titleLabel.text = category.title
        
        highlight.backgroundColor = selected ? #colorLiteral(red: 0.8618963957, green: 0, blue: 0, alpha: 1) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        titleLabel.alpha = selected ? 1 : 0.8
    }
}
