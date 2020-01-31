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
                cell.setup(filter, presenter, indexPath)
            }
            return cell
            
        case 4000:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
            if let product = presenter.productGetData(indexPath: indexPath) {
                cell.setup(product)
            }
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch tableView.tag {
        case 3000:
            let hview = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 20))
            let label = UILabel(frame: CGRect(x: 10, y: 7, width: view.frame.size.width, height: 20))
            label.text = presenter.filterGetSectionTitle(section: section)
            hview.addSubview(label)
            return hview
        case 4000:
            return UIView()
        default:
            return UIView()
        }
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch tableView.tag {
        case 3000:
            return presenter.filterGetSectionTitle(section: section)
        case 4000: return ""
        default:
            return ""
        }
    }
}


