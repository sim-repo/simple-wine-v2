import Foundation


//MARK:- Side Menu

extension MapPresenter {
    
    func resetShownFilters() {
        tmpShownFilter = filterDataSource.filter{$0.level == 0}
    }
    
    private func prepareShownFilters(by parent: Filter) {
        let currents = filterDataSource.filter{$0.parentId == parent.id}
        currents.forEach{ curr in
            tmpShownFilter.append(curr)
        }
    }
    
    func prepareFilterSection() {
        tmpFilterSectionTitle.removeAll()
        tmpFilterSectionTitle = tmpShownFilter.reduce(into: [Int: String]()) {
            $0[$1.level] = $1.parentTitle
        }
        let groupBySection = tmpShownFilter.group(by: \Filter.level)
        
        for item in groupBySection {
            let section = item.key
            let filters = item.values
            
            for (row, val) in filters.enumerated() {
                tmpFilterSection[IndexPath(row: row, section: section)] = val
            }
        }
    }
    
}


//MARK:- Called by View
extension MapPresenter: ViewableFilterPresenter {
    
    // getters
    func filterNumberOfSections() -> Int {
        return tmpFilterSectionTitle.count > 0 ? tmpFilterSectionTitle.count + 1 : 1
    }
    
    func filterNumberOfRowsInSection(section: Int) -> Int {
        let items = tmpFilterSection.filter{$0.key.section == section}
        return items.count
    }
    
    func filterGetData(indexPath: IndexPath) -> Filter? {
        return tmpFilterSection[indexPath]
    }
    
    func filterGetIndexPath(category: Category) -> IndexPath?{
        let dict = tmpFilterSection.first(where: {$0.value.id == category.id})
        return dict?.key
    }
    
    func filterGetSectionTitle(section: Int) -> String {
        guard tmpFilterSectionTitle.count > 0
            else {
                return ""
        }
        return tmpFilterSectionTitle[section] ?? ""
    }
    
    //setters
    func filterDidPress(at indexPath: IndexPath) {
        guard let filter = filterGetData(indexPath: indexPath) else { return }
        filter.selected = !filter.selected
        
        if filter.selected {
            addSelectedFilter(filter)
        } else {
            removeSelectedFilter(filter)
        }
        prepareProduct()
        view?.productReloadData()
    }
    
    func titleDidPress(at indexPath: IndexPath) {
        guard let filter = filterGetData(indexPath: indexPath) else { return }
        tmpShownFilter = tmpShownFilter.filter{$0.level <= filter.level}
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
