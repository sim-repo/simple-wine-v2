
import UIKit

class FilterTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleButton: UIButton!

    var presenter: ViewableFilterPresenter!
    var indexPath: IndexPath!
    var didSelect = false
    
    func setup(_ filter: Filter, _ presenter: ViewableFilterPresenter, _ indexPath: IndexPath) {
        titleButton.setTitle(filter.title, for: .normal)
        self.presenter = presenter
        self.indexPath = indexPath
        titleButton.showsTouchWhenHighlighted = true
        didSelect = filter.selected
    }
    
    @IBAction func doPressTitle(_ sender: Any) {
        presenter.titleDidPress(at: indexPath)
        presenter.filterDidPress(at: indexPath)
    }
}
