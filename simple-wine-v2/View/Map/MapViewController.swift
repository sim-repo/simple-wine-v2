import UIKit

class MapViewController: UIViewController {
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var selectedFilterCollectionView: UICollectionView!
    @IBOutlet weak var filterTableView: UITableView!
    @IBOutlet weak var productTableView: UITableView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var categoryHighlightView: UIView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var productMainView: UIView!
    @IBOutlet weak var separator1TopMenuView: UIView!
    @IBOutlet weak var separator2TopMenuView: UIView!
    
    
    
    @IBOutlet weak var selectedFilterHeightConstraint: NSLayoutConstraint!
    
    var presenter: MapPresenter {
        return MapPresenter.shared
    }
    
    var didHightlightDefaultLocated = false
    
    override func viewDidLoad() {
        registerNib()
        selectedFilterHeightConstraint.constant = 0 //disabled 1
        categoryHighlightView.isHidden = true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.setView(view: self)
        backgroundView.backgroundColor = Theme.bkg
        setupTables()
        setupCollections()
        setupSearchView()
        setupSearchBar()
        setupFavouriteNumber()
        setupBackButton()
        setupSeparator()
        setupProductMainContainerView()
    }
    
    private func setupTables(){
        filterTableView.allowsSelection = false
        productTableView.allowsSelection = false
        
        productTableView.layer.borderColor = Theme.borderOnBkg.cgColor
        productTableView.layer.borderWidth = 0.0
        
        filterTableView.backgroundColor = Theme.bkg
        productTableView.backgroundColor = Theme.bkg
    }
    
    private func setupCollections(){
        //categoryCollectionView.layer.borderColor = Theme.borderOnBkg.cgColor
       // categoryCollectionView.layer.borderWidth = 1.0
        
        categoryCollectionView.backgroundColor = Theme.bkg
        selectedFilterCollectionView.backgroundColor = Theme.bkg
    }
    
    private func setupProductMainContainerView(){
        productMainView.addPieceOfShadow()
        //productMainView.hideShadow(isHidden: true)
        productMainView.backgroundColor = Theme.bkg
    }
    
    private func setupSeparator(){
        separator1TopMenuView.backgroundColor = Theme.borderOnBkg
        separator2TopMenuView.backgroundColor = Theme.borderOnBkg
    }
    
    private func setupSearchView(){
     //   searchView.layer.borderWidth = 1
       // searchView.layer.borderColor = Theme.borderOnBkg.cgColor
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
    
    private func registerNib(){
        filterTableView.register( FilterSectionHeader.nib, forHeaderFooterViewReuseIdentifier: FilterSectionHeader.reuseIdentifier )
    }
    
    
    @IBAction func pressFavourite(_ sender: Any) {
        presenter.favouriteDidPress()
    }
    
    func setHighlight(destination: CGPoint, duration: TimeInterval) {
        if didHightlightDefaultLocated == false {
            didHightlightDefaultLocated = true
            
            let completion: (()->Void)? = {[weak self] in
                guard let self = self else { return }
                self.categoryHighlightView.isHidden = false
            }
            categoryHighlightView.move(to: destination, duration: 0, options: .curveEaseOut, completion: completion)
            return 
        }
        categoryHighlightView.move(to: destination, duration: duration, options: .curveEaseOut)
        
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
        navigationController?.popViewController(animated: true)
    }
}



extension MapViewController: PresentableMapView {

    
    func filterReloadData() {
        filterTableView.reloadData()
    }
    
    func productReloadData(at indexPath: IndexPath) {
        productTableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func productReloadData() {
        productTableView.reloadData()
    }
    
    func selectedFilterReloadData() {
        if self.presenter.selectedFilterNumberOfRowsInSection() > 0 {
            self.selectedFilterHeightConstraint.constant = 0 // disabled 30
        } else {
            self.selectedFilterHeightConstraint.constant = 0 //disabled 1
        }
        self.selectedFilterCollectionView.reloadData()
    }
    
    func categoryReloadData() {
        categoryCollectionView.reloadData()
    }
    
   func performMapDetailSegue(presenter: DetailMapPresenter) {
        performSegue(withIdentifier: "showDetailSegue", sender: presenter)
    }
    
    func performFavouriteSegue(presenter: FavouritePresenter) {
        performSegue(withIdentifier: "showFavouriteSegue", sender: presenter)
    }
    
    func favouriteNumberReload(number: Int) {
        favouriteButton.setTitle("Выбрано: \(number)", for: .normal)
        view.layoutIfNeeded()
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
