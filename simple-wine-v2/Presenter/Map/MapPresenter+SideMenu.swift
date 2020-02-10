import Foundation


//MARK:- Side Menu

extension MapPresenter {
    
    func getMaxLevel() -> Int {
        var maxLevel = filterDataSource.filter{$0.categoryId == currentCategoryId && $0.kindId == selectedFilter.kindId}.compactMap({$0.level}).max() ?? 0
        maxLevel += 1
        return maxLevel
    }
    
    
    func resetShownFilters() {
        tmpShownFilter = filterDataSource.filter{$0.level == 0 && $0.categoryId == currentCategoryId}
    }
    
    func prepareShownFilters(by parent: Filter) {
        
        let isPrice = menuMapEnum == .classic ? false : true  //# >> проект: тупые менеджера
        
        let filters = filterDataSource.filter{ $0.parentId == parent.id && $0.categoryId == currentCategoryId && $0.isPrice == isPrice }
        
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
}


//MARK:- Called by View

extension MapPresenter: ViewableFilterPresenter {
    
    // getters
    func filterNumberOfSections() -> Int {
        let maxLevel = getMaxLevel()
        return maxLevel > 1 ? maxLevel-1 : maxLevel
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
        if section == 0 {
            return "Фильтры"
        }
        let title = tmpFilterSectionTitle[section] ?? ""
        return title
    }
    
    func filterIsSelected(filter: Filter) -> Bool {
        guard let selected = selectedFilter
            else { return false }
        
        if let parentId = selected.parentId,
            let parentFilter = filterDataSource.first(where: {$0.id == parentId}) {
            if parentFilter.id == filter.id {
                return true
            }
        }
        return filter.id == selected.id
    }
    
    
    //setters
    func filterDidPress(at indexPath: IndexPath) {
        guard let filter = filterGetData(indexPath: indexPath) else { return }
        selectedFilter = filter
        
        tmpShownFilter = tmpShownFilter.filter{$0.level <= filter.level}
        prepareShownFilters(by: selectedFilter)
        
        let maxLevel = getMaxLevel()
        if maxLevel > 2 {
            let isPrice = menuMapEnum == .classic ? false : true  //# >> проект: тупые менеджера
            if let childFilter = filterDataSource.first(where: { $0.parentId == selectedFilter.id  && $0.isPrice == isPrice}) {
                selectedFilter = childFilter
            }
        }
        
        prepareFilterSection()
        view?.filterReloadData()
        
        prepareProduct()
        view?.productReloadData()
        view?.setFilterTitle(title: selectedFilter.title, volume: selectedFilter.volume.rawValue + " л")
    }
    
}

