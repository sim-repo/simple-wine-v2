import Foundation


//MARK:- Selected Filter

extension MapPresenter {
    
    
    func getSelectedFilter() -> SelectedFilter? {
        var selected = selectedFilters.first(where: {$0.categoryId == currentCategoryId})
        if selected == nil {
            selected = SelectedFilter(categoryId: currentCategoryId)
            selectedFilters.append(selected!)
        }
        return selected
    }
    
    func addSelectedFilter(_ filter: Filter) {
        getSelectedFilter()?.append(id: filter.id, title: filter.title, parentId: filter.parentId ?? 0, kind: filter.kindId)
        view?.selectedFilterReloadData()
    }
    
    func removeSelectedFilter(_ filter: Filter) {
        getSelectedFilter()?.remove(by: filter)
        view?.selectedFilterReloadData()
    }
    
    func removeSelectedFilter(at indexPath: IndexPath) {
        getSelectedFilter()?.remove(by: indexPath)
        view?.selectedFilterReloadData()
    }
}


//MARK:- Called by View

extension MapPresenter: ViewableSelectedFilterPresenter {
    
    func selectedFilterNumberOfRowsInSection() -> Int {
        return getSelectedFilter()?.filters.count ?? 0
    }
    
    func selectedFilterGetData(indexPath: IndexPath) -> SelectedFilter.InnerFilter? {
        return getSelectedFilter()?.filters[indexPath.row]
    }
    
    func selectedFilterGetIndexPath(selecteFilter: SelectedFilter.InnerFilter) -> IndexPath?{
        guard let idx = getSelectedFilter()?.filters.firstIndex(where: { $0.id == selecteFilter.id })
        else { return nil }
        return IndexPath(row: idx, section: 0)
    }
    
    func selectedFilterCancelDidPress(at indexPath: IndexPath) {
        guard let selectedFilter = getSelectedFilter()?.filters[indexPath.row] else { return }
        let id = selectedFilter.id
        removeSelectedFilter(at: indexPath)
        filterRemove(filterId: id)
        prepareProduct()
        view?.productReloadData()
    }
}


//MARK:- Called by Sync
extension MapPresenter {
    
}
