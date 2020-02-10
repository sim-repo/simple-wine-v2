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
            return presenter.productNumberOfRowsInSection(section: section)
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch tableView.tag {
            
        case 3000:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTableViewCell", for: indexPath) as! FilterTableViewCell
            if let filter = presenter.filterGetData(indexPath: indexPath) {
                let isSelected = presenter.filterIsSelected(filter: filter)
                cell.setup(filter, presenter, indexPath, isSelected)
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
        switch tableView.tag {
            case 4000:
                presenter.productDidPressDetail(indexPath: indexPath)
            default: break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch tableView.tag {
        case 3000:
            let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: FilterSectionHeader.reuseIdentifier) as! FilterSectionHeader
            cell.contentView.backgroundColor = Theme.bkg
            return cell
        case 4000:
             let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProductSectionHeader.reuseIdentifier) as! ProductSectionHeader
             cell.titleLabel.text = (presenter as ViewableProductPresenter).getSectionTitle(section: section)
             cell.titleLabel.font = Theme.charterBold(ofSize: 17)
             cell.titleLabel.textColor = Theme.unselected
             cell.contentView.backgroundColor = Theme.bkg
             return cell
        default:
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch tableView.tag {
        case 3000:
            return section > 0 ? 20 : 0
        case 4000:
            return 60
        default:
            return 0
        }
    }
    
}


