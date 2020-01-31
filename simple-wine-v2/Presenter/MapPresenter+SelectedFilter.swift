import Foundation


//MARK:- Selected Filter

extension MapPresenter {
    
    func addSelectedFilter(_ filter: Filter) {
        let selected = SelectedFilter(id: filter.id, title: filter.title)
        selectedFilter.append(selected)
    }
    
    func removeSelectedFilter(_ filter: Filter) {
        let selected = SelectedFilter(id: filter.id, title: filter.title)
        selectedFilter.removeAll(where: {$0.id == filter.id})
    }
}


//MARK:- Called by View
extension MapPresenter: ViewableSelectedFilterPresenter {
    
    final func selectedFilterNumberOfRowsInSection() -> Int {
        return selectedFilter.count
    }
    
    final func selectedFilterGetData(indexPath: IndexPath) -> SelectedFilter? {
        return selectedFilter[indexPath.row]
    }
    
    final func selectedFilterGetIndexPath(selecteFilter: SelectedFilter) -> IndexPath?{
        guard let idx = selectedFilter.firstIndex(where: { $0.id == selecteFilter.id })
            else { return nil }
        
        return IndexPath(row: idx, section: 0)
    }
}


//MARK:- Called by Sync
extension MapPresenter {
    
}
