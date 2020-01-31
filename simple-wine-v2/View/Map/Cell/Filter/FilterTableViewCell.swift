
import UIKit

class FilterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var filterButton: UIButton!
    
    
    func setup(filter: Filter) {
        titleLabel.text = filter.title
    }
    
    
    @IBAction func doPressFilter(_ sender: Any) {
    }
    
}
