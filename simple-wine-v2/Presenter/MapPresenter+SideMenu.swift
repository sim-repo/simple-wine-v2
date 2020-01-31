import Foundation


//MARK:- Side Menu

extension MapPresenter {
    
    func resetShownFilters() {
        shownFilter = filterDataSource.filter{$0.level == 0}
    }
    
    private func fillParentShownFilters(by child: Filter) {
        if let current = filterDataSource.first(where: {$0.id == child.parentId}) {
            shownFilter.append(current)
            fillParentShownFilters(by: current)
        } else {
            return
        }
    }
    
    private func fillChildShownFilters(by parent: Filter) {
        let currents = filterDataSource.filter{$0.parentId == parent.id}
        currents.forEach{ curr in
            shownFilter.append(curr)
        }
    }
}


//MARK:- Called by View
extension MapPresenter: ViewableFilterPresenter {
    
    // getters
    final func filterNumberOfSections() -> Int {
        return 1
    }
    
    final func filterNumberOfRowsInSection(section: Int) -> Int {
        return shownFilter.count
    }
    
    final func filterGetData(indexPath: IndexPath) -> Filter? {
        return shownFilter[indexPath.row]
    }
    
    final func filterGetIndexPath(category: Category) -> IndexPath?{
        guard let idx = shownFilter.firstIndex(where: { $0.id == category.id })
            else { return nil }
        
        return IndexPath(row: idx, section: 0)
    }
    
    //setters
    func filterDidPress(at indexPath: IndexPath) {
        
    }
    
    func titleDidPress(at indexPath: IndexPath) {
        guard let filter = filterGetData(indexPath: indexPath) else { return }
        shownFilter = shownFilter.filter{$0.level <= filter.level}
       // fillParentShownFilters(by: filter)
        fillChildShownFilters(by: filter)
        view?.filterReloadData()
    }
}


//MARK:- Called by Sync
extension MapPresenter {
    
    func getOnSuccessFilter() -> ((_ filters: [Filter]) -> Void)?  {
        
        let onSuccessFilter: ((_ filters: [Filter]) -> Void)? = { [weak self] filters in
            self?.setFilterDataSource(filters: filters)
        }
        return onSuccessFilter
    }
    
    func getOnErrorFilter() -> ((_ error: String) -> Void)?  {
        
        let onErrorFilter: ((_ error: String) -> Void)? = { [weak self] error in
            //log
        }
        return onErrorFilter
    }
    
}
