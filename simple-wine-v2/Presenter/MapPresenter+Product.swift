import Foundation


//MARK:- Product

extension MapPresenter {
    
    
    func prepareProduct() {
        tmpShownProducts.removeAll()
        selectedFilter.forEach { selected in
            let products = productDataSource.filter{$0.filterIds.contains(selected.id)}
            products.forEach{ product in
                if !tmpShownProducts.contains(where: {$0.id == product.id}) {
                    tmpShownProducts.append(product)
                }
            }
        }
    }
}


//MARK:- Called by View
extension MapPresenter: ViewableProductPresenter {
    
    func productNumberSections() -> Int {
        return 1
    }
    
    final func productNumberOfRowsInSection() -> Int {
        return tmpShownProducts.count
    }
    
    final func productGetData(indexPath: IndexPath) -> Product? {
        return tmpShownProducts[indexPath.row]
    }
    
    final func productGetIndexPath(product: Product) -> IndexPath?{
        if let idx = tmpShownProducts.firstIndex(where: {$0.id == product.id}) {
            return IndexPath(row: idx, section: 0)
        }
        return nil
    }
}


//MARK:- Called by Sync
extension MapPresenter {
    
}
