
import UIKit

class FilterTableViewCell: UITableViewCell {
    

    @IBOutlet weak var titleButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    
    var presenter: ViewableFilterPresenter!
    var indexPath: IndexPath!
    
    func setup(_ filter: Filter, _ presenter: ViewableFilterPresenter, _ indexPath: IndexPath) {
        titleButton.setTitle(filter.title, for: .normal)
        self.presenter = presenter
        self.indexPath = indexPath
    }
    
    @IBAction func doPressTitle(_ sender: Any) {
        presenter.titleDidPress(at: indexPath)
    }
    
    @IBAction func doPressFilter(_ sender: Any) {
    }
    
}
