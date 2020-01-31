import Foundation


//MARK:- Top Menu


//MARK:- Called by View
extension MapPresenter: ViewableCategoryPresenter {
    
    final func categoryNumberOfRowsInSection() -> Int {
        return categoryDataSource.count
    }
    
    final func categoryGetData(indexPath: IndexPath) -> Category? {
        return categoryDataSource[indexPath.row]
    }
    
    final func categoryGetIndexPath(category: Category) -> IndexPath?{
        guard let idx = categoryDataSource.firstIndex(where: { $0.id == category.id })
            else { return nil }
        
        return IndexPath(row: idx, section: 0)
    }
}


//MARK:- Called by Sync
extension MapPresenter {
    
}
