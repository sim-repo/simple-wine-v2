import Foundation


//MARK:- Side Menu

extension MapPresenter {
    
    func resetShownFilters() {
        tmpShownFilter = filterDataSource.filter{$0.level == 0 && $0.categoryId == currentCategoryId}
    }
    
    func prepareShownFilters(by parent: Filter) {
        
        let filters = filterDataSource.filter{$0.parentId == parent.id && $0.categoryId == currentCategoryId}
        
        for filter in filters {
            tmpShownFilter.append(filter)
        }
    }
    
    func prepareFilterSection() {
        tmpFilterSectionTitle.removeAll()
        tmpFilterSection.removeAll()
        
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
    
    func filterRemove(filterId: Int) {
        guard let filter = filterDataSource.first(where: {$0.id == filterId}) else { return }
        filter.selected = false
        view?.filterReloadData()
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
                return "Фильтры"
        }
        return tmpFilterSectionTitle[section] ?? "Фильтры"
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
