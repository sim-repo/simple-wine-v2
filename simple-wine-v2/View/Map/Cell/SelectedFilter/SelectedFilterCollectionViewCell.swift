import UIKit

class SelectedFilterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    func setup(selectedFilter: SelectedFilter) {
        titleLabel.text = selectedFilter.title
    }
    
    
    @IBAction func doPressFilterCancel(_ sender: Any) {
    }
    
}
