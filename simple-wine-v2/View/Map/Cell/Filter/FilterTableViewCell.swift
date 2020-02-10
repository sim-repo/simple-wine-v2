
import UIKit

class FilterTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleButton: UIButton!

    var presenter: ViewableFilterPresenter!
    var indexPath: IndexPath!
    var didSelect = false
    
    func setup(_ filter: Filter, _ presenter: ViewableFilterPresenter, _ indexPath: IndexPath, _ isSelected: Bool) {
        titleButton.setTitle(filter.title, for: .normal)
        self.presenter = presenter
        self.indexPath = indexPath
        titleButton.showsTouchWhenHighlighted = true
        let color = isSelected ? Theme.selected : Theme.unselected
        titleButton.setTitleColor(color, for: .normal)
    }
    
    @IBAction func doPressTitle(_ sender: Any) {
        presenter.titleDidPress(at: indexPath)
        presenter.filterDidPress(at: indexPath)
    }
}
