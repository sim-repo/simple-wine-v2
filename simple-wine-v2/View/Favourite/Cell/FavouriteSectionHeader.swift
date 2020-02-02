import UIKit

class FavouriteSectionHeader: UITableViewCell {
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var itemsNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
