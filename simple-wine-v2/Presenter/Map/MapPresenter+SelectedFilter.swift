import Foundation


//MARK:- Selected Filter

extension MapPresenter {
    
    func addSelectedFilter(_ filter: Filter) {
        let selected = SelectedFilter(id: filter.id, title: filter.title, parentId: filter.parentId ?? 0, kind: filter.kindId)
        selectedFilter.append(selected)
        view?.selectedFilterReloadData()
    }
    
    func removeSelectedFilter(_ filter: Filter) {
        selectedFilter.removeAll(where: {$0.id == filter.id})
        view?.selectedFilterReloadData()
    }
    
    func removeSelectedFilter(at indexPath: IndexPath) {
        selectedFilter.remove(at: indexPath.row)
        view?.selectedFilterReloadData()
    }
}


//MARK:- Called by View
extension MapPresenter: ViewableSelectedFilterPresenter {
    
    func selectedFilterNumberOfRowsInSection() -> Int {
        return selectedFilter.count
    }
    
    func selectedFilterGetData(indexPath: IndexPath) -> SelectedFilter? {
        return selectedFilter[indexPath.row]
    }
    
    func selectedFilterGetIndexPath(selecteFilter: SelectedFilter) -> IndexPath?{
        guard let idx = selectedFilter.firstIndex(where: { $0.id == selecteFilter.id })
            else { return nil }
        
        return IndexPath(row: idx, section: 0)
    }
    
    func selectedFilterCancelDidPress(at indexPath: IndexPath) {
        let id = selectedFilter[indexPath.row].id
        removeSelectedFilter(at: indexPath)
        filterRemove(filterId: id)
        prepareProduct()
        view?.productReloadData()
    }
}


//MARK:- Called by Sync
extension MapPresenter {
    
}
