import UIKit


//MARK:- Side Menu + Product

extension MapViewController: UITableViewDataSource , UITableViewDelegate{
    
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
                cell.setup(filter, presenter, indexPath)
            }
            return cell
            
        case 4000:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
            if let product = presenter.productGetData(indexPath: indexPath) {
                cell.setup(product, presenter: presenter, indexPath: indexPath)
            }
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch tableView.tag {
        case 3000:
            let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: FilterSectionHeader.reuseIdentifier) as! FilterSectionHeader
            cell.title.text = presenter.filterGetSectionTitle(section: section)
            cell.contentView.backgroundColor = #colorLiteral(red: 0.8085502982, green: 0.8029457927, blue: 0.7642779946, alpha: 1)
            return cell
        case 4000:
            return UIView()
        default:
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch tableView.tag {
        case 3000:
            return 42
        case 4000:
            return 0
        default:
            return 0
        }
    }
    
}


