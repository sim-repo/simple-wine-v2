import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    func setup(category: Category) {
        imageView.image = UIImage(named: "wine")
        titleLabel.text = category.title
    }
}
