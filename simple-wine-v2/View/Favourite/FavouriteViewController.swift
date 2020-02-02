import UIKit

class FavouriteViewController: UIViewController {
    
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
        let image = getSystemImage(name: "arrow.left.circle", pointSize: 20, color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        backButton.setImage(image, for: .normal)
    }
    
    @IBAction func pressBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
            cell.contentView.backgroundColor = #colorLiteral(red: 0.935985744, green: 0.9304216504, blue: 0.9402627349, alpha: 1)
            return cell
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}


extension FavouriteViewController: PresentableFavouriteView {
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func performFavouriteDetailSegue(presenter: FavouriteDetailPresenter) {
        
    }
}

