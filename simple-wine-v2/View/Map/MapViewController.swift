import UIKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var selectedFilterCollectionView: UICollectionView!
    @IBOutlet weak var filterTableView: UITableView!
    @IBOutlet weak var productTableView: UITableView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var sortButton: DropDownButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var selectedFilterHeightConstraint: NSLayoutConstraint!
    
    var presenter: MapPresenter {
        return MapPresenter.shared
    }
    
    override func viewDidLoad() {
        registerNib()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.setView(view: self)
        setupTables()
        setupSearchView()
        setupSortButton()
        setupSearchBar()
        
        selectedFilterHeightConstraint.constant = 1
    }
    
    private func setupTables(){
        filterTableView.allowsSelection = false
        productTableView.allowsSelection = false
        
        productTableView.layer.borderColor = #colorLiteral(red: 0.8819957972, green: 0.8767530322, blue: 0.8860259652, alpha: 1)
        productTableView.layer.borderWidth = 1.0
    }
    
    private func setupSearchView(){
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = #colorLiteral(red: 0.8819957972, green: 0.8767530322, blue: 0.8860259652, alpha: 1)
    }
    
    private func setupSortButton(){
        sortButton.setupPresenter(sortablePresenter: presenter)
        sortButton.layer.borderWidth = 1
        sortButton.layer.borderColor = #colorLiteral(red: 0.8819957972, green: 0.8767530322, blue: 0.8860259652, alpha: 1)
    }
    
    private func setupSearchBar(){
        searchBar.delegate = self
    }
    
    private func registerNib(){
        filterTableView.register( FilterSectionHeader.nib, forHeaderFooterViewReuseIdentifier: FilterSectionHeader.reuseIdentifier )
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



extension MapViewController: UISearchBarDelegate {


    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        presenter.productSearchTextDidBeginEditing()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("begin searchBarTextDidEndEditing")
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.productSearchTextDidChange(textSearch: searchText)
    }
}
