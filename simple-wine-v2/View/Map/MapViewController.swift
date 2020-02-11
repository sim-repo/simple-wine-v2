import UIKit

class MapViewController: UIViewController {
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var filterTableView: UITableView!
    @IBOutlet weak var productTableView: UITableView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var productMainView: UIView!
    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var separator1TopMenuView: UIView!
    @IBOutlet weak var separator2TopMenuView: UIView!
    
    @IBOutlet weak var filterTitleLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!

    
    var presenter: MapPresenter {
        return MapPresenter.shared
    }
    
    var didHightlightDefaultLocated = false
    
    override func viewDidLoad() {
        registerNib()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.setView(view: self)
        backgroundView.backgroundColor = Theme.bkg
        setupTables()
        setupCollections()
        setupSearchBar()
        setupFavouriteNumber()
        setupBackButton()
        setupSeparator()
        setupProductMainContainerView()
        setupMenuMapDependencies()
        setupFilterTitle()
    }
    
    private func setupTables(){
        filterTableView.allowsSelection = false
        productTableView.allowsSelection = true
        
        productTableView.layer.borderColor = Theme.borderOnBkg.cgColor
        productTableView.layer.borderWidth = 0.0
        
        filterTableView.backgroundColor = Theme.bkg
        productTableView.backgroundColor = Theme.bkg
    }
    
    private func setupCollections(){
        categoryCollectionView.backgroundColor = Theme.bkg
    }
    
    private func setupProductMainContainerView(){
        productMainView.addPieceOfShadow()
        productMainView.backgroundColor = Theme.bkg
    }
    
    
    private func setupMenuMapDependencies() {
        mainTitle.text = presenter.getMainTitle()
    }
    
    private func setupSeparator(){
        separator1TopMenuView.backgroundColor = Theme.borderOnBkg
        separator2TopMenuView.backgroundColor = Theme.borderOnBkg
    }
    
    private func setupSearchBar(){
        searchBar.delegate = self
        searchBar.barTintColor = .white
        searchBar.searchBarStyle = .minimal
        searchBar.layer.borderWidth = 0
        searchBar.layer.borderColor = UIColor.clear.cgColor
    }
    
    private func setupFavouriteNumber() {
        let count = presenter.getFavouriteNumber()
        favouriteButton.setTitle("Выбрано: \(count)", for: .normal)
    }
    
    private func setupBackButton(){
        backButton.setImage(UIImage(named: "LeftArrowButton"), for: .normal)
    }
    
    private func setupFilterTitle() {
        filterTitleLabel.textColor = Theme.unselected
        volumeLabel.textColor = Theme.unselected
        filterTitleLabel.font = Theme.charterBold(ofSize: 17)
        volumeLabel.font = Theme.charterBold(ofSize: 17)
    }
    
    
    private func registerNib(){
        filterTableView.register( FilterSectionHeader.nib, forHeaderFooterViewReuseIdentifier: FilterSectionHeader.reuseIdentifier )
        productTableView.register( ProductSectionHeader.nib, forHeaderFooterViewReuseIdentifier: ProductSectionHeader.reuseIdentifier )
    }
    
    
    @IBAction func pressFavourite(_ sender: Any) {
        presenter.favouriteDidPress()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let dest = segue.destination as? MapDetailViewController,
        let presenter = sender as? DetailMapPresenter {
            dest.setup(presenter: presenter)
        }
        
        if let dest = segue.destination as? FavouriteViewController,
        let presenter = sender as? FavouritePresenter {
            dest.presenter = presenter
        }
    }
    
    @IBAction func pressBack(_ sender: Any) {
        presenter.back()
        navigationController?.popViewController(animated: true)
    }
}


extension MapViewController: PresentableMapView {

    
    func filterReloadData() {
        ThreadConstant.UI_THREAD {
            self.filterTableView.reloadData()
        }
    }
    
    func productReloadData(at indexPath: IndexPath) {
        ThreadConstant.UI_THREAD {
           self.productTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    func productReloadData() {
        ThreadConstant.UI_THREAD {
           self.productTableView.reloadData()
        }
    }
    
    func categoryReloadData() {
        ThreadConstant.UI_THREAD {
            self.categoryCollectionView.reloadData()
        }
    }
    
   func performMapDetailSegue(presenter: DetailMapPresenter) {
        ThreadConstant.UI_THREAD {
            self.performSegue(withIdentifier: "showDetailSegue", sender: presenter)
        }
    }
    
    func performFavouriteSegue(presenter: FavouritePresenter) {
        ThreadConstant.UI_THREAD {
            self.performSegue(withIdentifier: "showFavouriteSegue", sender: presenter)
        }
    }
    
    func favouriteNumberReload(number: Int) {
        ThreadConstant.UI_THREAD {
            self.favouriteButton.setTitle("Выбрано: \(number)", for: .normal)
            self.view.layoutIfNeeded()
        }
    }
    
    func setFilterTitle(title: String, volume: String) {
        ThreadConstant.UI_THREAD {
            self.filterTitleLabel.text = title
            self.volumeLabel.text = volume
        }
    }
}



extension MapViewController: UISearchBarDelegate {


    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        presenter.productSearchTextDidBeginEditing()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.productSearchTextDidChange(textSearch: searchText)
    }
}
