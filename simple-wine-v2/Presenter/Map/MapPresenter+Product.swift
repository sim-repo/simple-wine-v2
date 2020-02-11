import Foundation


//MARK:- Product

extension MapPresenter {
    
    func prepareProduct() {
        tmpShownProductSectionTitle.removeAll()
        tmpShownProductsByFilter.removeAll()
        guard selectedFilter != nil else { return }
        
        fillProductsByFilter()
    }
    
    
    private func fillProductsByFilter() {
        
        let childFilters = filterDataSource.filter{ $0.parentId == selectedFilter.id }
        if childFilters.isEmpty == false {
            for (section, filter) in childFilters.enumerated() {
                tmpShownProductSectionTitle[section] = filter.title
                var products = productDataSource.filter{ $0.attributeIds.contains(filter.id) }
                
                products = products.sorted { $0.price < $1.price }
                
                for (row, product) in products.enumerated() {
                    tmpShownProductsByFilter[IndexPath(row: row, section: section)] = product
                }
            }
        }
    }
    
    
    private func fillProductsBySearch( searchText: String ) {
        let products = productDataSource.filter{ $0.name.lowercased().contains(searchText.lowercased())}
        tmpShownProductSectionTitle.removeAll()
        tmpShownProductsByFilter.removeAll()
        tmpShownProductSectionTitle[0] = "Результаты поиска:"
        for (row, product) in products.enumerated() {
             tmpShownProductsByFilter[IndexPath(row: row, section: 0)] = product
        }
    }
}


//MARK:- Called by View

extension MapPresenter: ViewableProductPresenter {
    
    func productNumberSections() -> Int {
        return tmpShownProductSectionTitle.count > 0 ? tmpShownProductSectionTitle.count : 1
    }
    
    
    func productNumberOfRowsInSection(section: Int) -> Int {
        let items = tmpShownProductsByFilter.filter{$0.key.section == section}
        return items.count
    }
    
    
    func productGetData(indexPath: IndexPath) -> Product? {
        return tmpShownProductsByFilter[indexPath]
    }
    
    
    func productGetIndexPath(product: Product) -> IndexPath? {
        let dict = tmpShownProductsByFilter.first(where: {$0.value.id == product.id})
        return dict?.key
    }
    
    
    func getSectionTitle(section: Int) -> String {
        guard tmpShownProductSectionTitle.count > 0
            else {
                return ""
        }
        return tmpShownProductSectionTitle[section] ?? ""
    }
    
    
    func productSearchTextDidBeginEditing() {}
    
    
    func productSearchTextDidChange(textSearch: String) {
        fillProductsBySearch(searchText: textSearch)
        view?.productReloadData()
    }
    
    
    func productDidPressDetail(indexPath: IndexPath) {
        let detailMapPresenter = DetailMapPresenter()
        detailMapPresenter.delegate = self
        let product = productGetData(indexPath: indexPath)
        detailMapPresenter.product = product
        let setting = detailMapSettingDataSource.first(where: {$0.categoryId == currentCategoryId})
        detailMapPresenter.detailMapSetting = setting
        view?.performMapDetailSegue(presenter: detailMapPresenter)
    }
}
