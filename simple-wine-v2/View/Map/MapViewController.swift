import UIKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var selectedFilterCollectionView: UICollectionView!
    @IBOutlet weak var filterTableView: UITableView!
    @IBOutlet weak var productTableView: UITableView!
    
    @IBOutlet weak var selectedFilterHeightConstraint: NSLayoutConstraint!
    
    var presenter: MapPresenter {
        return MapPresenter.shared
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.setView(view: self)
        setupTables()
        selectedFilterHeightConstraint.constant = 1
    }
    
    private func setupTables(){
        filterTableView.allowsSelection = false
        productTableView.allowsSelection = false
    }
}



extension MapViewController: PresentableView {
    
    func filterReloadData() {
        filterTableView.reloadData()
    }
    
    func productReloadData() {
        productTableView.reloadData()
    }
    
    func selectedFilterReloadData() {
        if self.presenter.selectedFilterNumberOfRowsInSection() > 0 {
            self.selectedFilterHeightConstraint.constant = 60
        } else {
            self.selectedFilterHeightConstraint.constant = 1
        }
        self.selectedFilterCollectionView.reloadData()
    }
}
