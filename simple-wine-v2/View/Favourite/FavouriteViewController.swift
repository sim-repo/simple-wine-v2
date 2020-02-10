import UIKit

class FavouriteViewController: UIViewController {
    
    @IBOutlet var bkgView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    
    var presenter: ViewableFavouritePresenter!
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.setView(view: self)
    }
    
    override func viewDidLoad() {
        setupOutlets()
    }
    
    private func setupOutlets(){
        bkgView.backgroundColor = Theme.bkgFavouriteDetail
        backButton.setImage(UIImage(named: "LeftArrowButton"), for: .normal)
    }
    
    @IBAction func pressBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? FavouriteDetailViewController,
            let presenter = sender as? FavouriteDetailPresenter {
            dest.setup(presenter: presenter)
        }
    }
}


extension FavouriteViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteCell", for: indexPath) as! FavouriteTableViewCell
        if let product = presenter.getData(indexPath: indexPath) {
            cell.setup(product: product)
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteSectionHeader") as! FavouriteSectionHeader
        let sectionTitle = presenter.getSectionTitle(section: section)
        if sectionTitle != "" {
            cell.categoryTitleLabel.text = presenter.getSectionTitle(section: section)
            cell.itemsNumberLabel.text = "\(presenter.numberOfRowsInSection(section: section))"
            cell.contentView.backgroundColor = Theme.bkgFavouriteSectionHeader
            return cell
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.productDidPressDetail(indexPath: indexPath)
    }
}


extension FavouriteViewController: PresentableFavouriteView {
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func performFavouriteDetailSegue(presenter: ViewableDetailFavouritePresenter) {
        performSegue(withIdentifier: "showFavouriteDetailSegue", sender: presenter)
    }
}


