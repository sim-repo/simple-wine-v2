import UIKit

class MapViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var selectedFilterCollectionView: UICollectionView!
    @IBOutlet weak var filterTableView: UITableView!
    @IBOutlet weak var productTableView: UITableView!
    
    var presenter: MapPresenter {
        return MapPresenter.shared
    }

    override func viewDidAppear(_ animated: Bool) {
        presenter.setView(view: self)
        setupTables()
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
        selectedFilterCollectionView.reloadData()
    }
}
