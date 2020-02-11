
import UIKit

class FilterTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleButton: UIButton!
    @IBOutlet weak var itemCountLabel: UILabel!
    
    var presenter: ViewableFilterPresenter!
    var indexPath: IndexPath!
    var didSelect = false
    
    func setup(_ filter: Filter, _ presenter: ViewableFilterPresenter, _ indexPath: IndexPath, _ isSelected: Bool, itemCounts: Int) {
        self.presenter = presenter
        self.indexPath = indexPath
        setupOutlets(filter, itemCounts, isSelected)
    }
    
    
    private func setupOutlets(_ filter: Filter, _ itemCounts: Int, _ isSelected: Bool){
        titleButton.setTitle(filter.title, for: .normal)
        titleButton.showsTouchWhenHighlighted = true
        let color = isSelected ? Theme.selected : Theme.unselected
        titleButton.setTitleColor(color, for: .normal)
        
        itemCountLabel.textColor = Theme.unselected
        itemCountLabel.font = Theme.charterBold(ofSize: 10)
        itemCountLabel.text = "\(presenter.filterGetItemsByFilter(filter: filter))"
    }
    
    @IBAction func doPressTitle(_ sender: Any) {
        presenter.filterDidPress(at: indexPath)
    }
}
