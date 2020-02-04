import Foundation


//MARK:- Top Menu


//MARK:- Called by View
extension MapPresenter: ViewableCategoryPresenter {
    
    func categoryNumberOfRowsInSection() -> Int {
        return categoryDataSource.count
    }
    
    func categoryGetData(indexPath: IndexPath) -> Category? {
        return categoryDataSource[indexPath.row]
    }
    
    func categoryGetIndexPath(category: Category) -> IndexPath?{
        guard let idx = categoryDataSource.firstIndex(where: { $0.id == category.id })
            else { return nil }
        return IndexPath(row: idx, section: 0)
    }
    
    func categoryDidPress(at indexPath: IndexPath) {
        currentCategoryId = categoryGetData(indexPath: indexPath)?.id ?? 0
        resetShownFilters()
        prepareFilterSection()
        prepareProduct()
        view?.categoryReloadData()
        view?.filterReloadData()
        view?.productReloadData()
        view?.selectedFilterReloadData()
    }
    
    func categoryIsSelected(indexPath: IndexPath) -> Bool {
        return currentCategoryId == indexPath.row
    }
}
