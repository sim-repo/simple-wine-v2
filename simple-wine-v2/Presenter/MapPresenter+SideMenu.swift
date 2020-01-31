import Foundation


//MARK:- Side Menu

extension MapPresenter {
    
    func resetShownFilters() {
        shownFilter = filterDataSource.filter{$0.level == 0}
    }
    
    private func prepareShownFilters(by parent: Filter) {
        let currents = filterDataSource.filter{$0.parentId == parent.id}
        currents.forEach{ curr in
            shownFilter.append(curr)
        }
    }
    
    func prepareFilterSection() {
        filterSectionTitle.removeAll()
        filterSectionTitle = shownFilter.reduce(into: [Int: String]()) {
            $0[$1.level] = $1.parentTitle
        }
        let groupBySection = shownFilter.group(by: \Filter.level)
        
        for item in groupBySection {
            let section = item.key
            let filters = item.values
            
            for (row, val) in filters.enumerated() {
                filterSection[IndexPath(row: row, section: section)] = val
            }
        }
    }
    
}


//MARK:- Called by View
extension MapPresenter: ViewableFilterPresenter {
    
    // getters
    func filterNumberOfSections() -> Int {
        return filterSectionTitle.count > 0 ? filterSectionTitle.count + 1 : 1
    }
    
    func filterNumberOfRowsInSection(section: Int) -> Int {
        let items = filterSection.filter{$0.key.section == section}
        return items.count
    }
    
    func filterGetData(indexPath: IndexPath) -> Filter? {
        return filterSection[indexPath]
    }
    
    func filterGetIndexPath(category: Category) -> IndexPath?{
        let dict = filterSection.first(where: {$0.value.id == category.id})
        return dict?.key
    }
    
    func filterGetSectionTitle(section: Int) -> String {
        guard filterSectionTitle.count > 0
            else {
                return ""
        }
        return filterSectionTitle[section] ?? ""
    }
    
    //setters
    func filterDidPress(at indexPath: IndexPath) {
        
    }
    
    func titleDidPress(at indexPath: IndexPath) {
        guard let filter = filterGetData(indexPath: indexPath) else { return }
        shownFilter = shownFilter.filter{$0.level <= filter.level}
        prepareShownFilters(by: filter)
        prepareFilterSection()
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
