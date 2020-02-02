import UIKit

class FilterSectionHeader: UITableViewHeaderFooterView {

    @IBOutlet weak var title: UILabel!
    
    static let reuseIdentifier: String = String(describing: self)

    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
 
}
