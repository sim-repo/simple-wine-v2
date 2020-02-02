import UIKit

class SelectedFilterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var presenter: ViewableSelectedFilterPresenter!
    var indexPath: IndexPath!
    
    func setup(_ selectedFilter: SelectedFilter.InnerFilter, _ presenter: ViewableSelectedFilterPresenter, _ indexPath: IndexPath) {
        titleLabel.text = selectedFilter.title
        self.presenter = presenter
        self.indexPath = indexPath
    }
    
    
    @IBAction func doPressFilterCancel(_ sender: Any) {
        presenter.selectedFilterCancelDidPress(at: indexPath)
    }
}
