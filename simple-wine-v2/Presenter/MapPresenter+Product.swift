import Foundation


//MARK:- Product

extension MapPresenter {
    
}


//MARK:- Called by View
extension MapPresenter: ViewableProductPresenter {
    
    func productNumberSections() -> Int {
        return 1
    }
    
    final func productNumberOfRowsInSection() -> Int {
        return productDataSource.count
    }
    
    final func productGetData(indexPath: IndexPath) -> Product? {
        return productDataSource[indexPath.row]
    }
    
    final func productGetIndexPath(product: Product) -> IndexPath?{
        guard let idx = productDataSource.firstIndex(where: { $0.id == product.id })
            else { return nil }
        
        return IndexPath(row: idx, section: 0)
    }
}


//MARK:- Called by Sync
extension MapPresenter {
    
}
