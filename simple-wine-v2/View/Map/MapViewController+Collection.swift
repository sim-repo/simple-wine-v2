import UIKit

//MARK:- Top Menu + SelectedFilter

extension MapViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
            case 1000:
                return presenter.categoryNumberOfRowsInSection()
            case 2000:
                return presenter.selectedFilterNumberOfRowsInSection()
            default:
                return 0
        }

    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView.tag {
            case 1000:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
                if let category = presenter.categoryGetData(indexPath: indexPath) {
                    let isSelected = presenter.categoryIsSelected(indexPath: indexPath)
                    cell.setup(category, selected: isSelected)
                }
                return cell
            
            case 2000:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectedFilterCollectionViewCell", for: indexPath) as! SelectedFilterCollectionViewCell
                if let selectedFilter = presenter.selectedFilterGetData(indexPath: indexPath) {
                    cell.setup(selectedFilter, presenter, indexPath)
                }
                return cell
            
            default:
                return UICollectionViewCell()
        }
    }
}


extension MapViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView.tag {
            case 1000:
                presenter.categoryDidPress(at: indexPath)
            break
            case 2000: break
            default: break
        }
    }
    
}
