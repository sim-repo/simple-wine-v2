import Foundation


//MARK:- Side Menu

extension MapPresenter {

    private func fillShownFilters(by child: Filter) {
        if let current = filterDataSource.first(where: {$0.id == child.parentId}) {
            shownFilter.append(current)
            fillShownFilters(by: current)
        } else {
            return
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
        return filterDataSource.count
    }
    
    final func filterGetData(indexPath: IndexPath) -> Filter? {
        return filterDataSource[indexPath.row]
    }
    
    final func filterGetIndexPath(category: Category) -> IndexPath?{
        guard let idx = filterDataSource.firstIndex(where: { $0.id == category.id })
            else { return nil }
        
        return IndexPath(row: idx, section: 0)
    }
    
    //setters
    func filterDidDrillDown(at indexPath: IndexPath) {
        guard let filter = filterGetData(indexPath: indexPath) else { return }
        shownFilter.removeAll()
        fillShownFilters(by: filter)
        
    }
}


//MARK:- Called by Sync
extension MapPresenter {
    
}
