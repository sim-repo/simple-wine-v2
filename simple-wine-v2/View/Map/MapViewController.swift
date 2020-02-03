import UIKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var selectedFilterCollectionView: UICollectionView!
    @IBOutlet weak var filterTableView: UITableView!
    @IBOutlet weak var productTableView: UITableView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var sortButton: DropDownButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var categoryHighlightView: UIView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var selectedFilterHeightConstraint: NSLayoutConstraint!
    
    var presenter: MapPresenter {
        return MapPresenter.shared
    }
    
    var didHightlightDefaultLocated = false
    
    override func viewDidLoad() {
        registerNib()
        selectedFilterHeightConstraint.constant = 1
        categoryHighlightView.isHidden = true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.setView(view: self)
        setupTables()
        setupCollections()
        setupSearchView()
        setupSortButton()
        setupSearchBar()
        setupFavouriteNumber()
        setupBackButton()
    }
    
    private func setupTables(){
        filterTableView.allowsSelection = false
        productTableView.allowsSelection = false
        
        productTableView.layer.borderColor = #colorLiteral(red: 0.8819957972, green: 0.8767530322, blue: 0.8860259652, alpha: 1)
        productTableView.layer.borderWidth = 1.0
    }
    
    private func setupCollections(){
        categoryCollectionView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        categoryCollectionView.layer.borderWidth = 1.0
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
    
    private func setupFavouriteNumber() {
        let count = presenter.getFavouriteNumber()
        favouriteButton.setTitle("Выбрано: \(count)", for: .normal)
    }
    
    private func setupBackButton(){
        let image = getSystemImage(name: "arrow.left.circle", pointSize: 20, color: #colorLiteral(red: 0.3537644148, green: 0.2710422873, blue: 0.2512474954, alpha: 1) )
        backButton.setImage(image, for: .normal)
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
            self.selectedFilterHeightConstraint.constant = 30
        } else {
            self.selectedFilterHeightConstraint.constant = 1
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
