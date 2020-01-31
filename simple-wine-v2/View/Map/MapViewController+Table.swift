import UIKit


//MARK:- Side Menu + Product

extension MapViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        switch tableView.tag {
            case 3000:
                return presenter.filterNumberOfSections()
            case 4000:
                return presenter.productNumberSections()
            default:
                return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView.tag {
            case 3000:
                return presenter.filterNumberOfRowsInSection(section: section)
            case 4000:
                return presenter.productNumberOfRowsInSection()
            default:
                return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch tableView.tag {
            
            case 3000:
                let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTableViewCell", for: indexPath) as! FilterTableViewCell
                if let filter = presenter.filterGetData(indexPath: indexPath) {
                    cell.setup(filter: filter)
                }
                return cell
            
            case 4000:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
                if let product = presenter.productGetData(indexPath: indexPath) {
                    cell.setup(product: product)
                }
                return cell
            
            default:
                return UITableViewCell()
        }
    }
    
    
}
