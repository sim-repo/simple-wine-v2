import UIKit

class MapViewController: UIViewController {

    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var selectedFilterCollectionView: UICollectionView!
    @IBOutlet weak var sideMenuTableView: UITableView!
    @IBOutlet weak var productTableView: UITableView!
    
    var presenter: MapPresenter {
        return MapPresenter.shared
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
