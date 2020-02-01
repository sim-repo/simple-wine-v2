import Foundation


//MARK:- Product

extension MapPresenter {
    
    func prepareProduct() {
        
        tmpShownProducts.removeAll()
        
        var filteredProductsByKind = [Int: Set<Int>]() // kind: Set<productIds>
        
        // 1 group by
        let groupByKind = selectedFilter.group(by: \SelectedFilter.kind)
        
        // 2 apply grouped by filters
        for filtersPerKind in groupByKind {
            
            let filters = filtersPerKind.values
            for filter in filters {
                
                let products = productDataSource.filter{$0.filterIds.contains(filter.id)}
                products.forEach{ product in
                    var set = filteredProductsByKind[filtersPerKind.key]
                    if set == nil {
                        set = Set<Int>()
                    }
                    set?.insert(product.id)
                    filteredProductsByKind[filtersPerKind.key] = set
                }
            }
        }
        let sets = filteredProductsByKind.map{$0.value}
        guard !sets.isEmpty else { return }
        var resultSet = sets[0]
        for (_, set) in sets.enumerated() {
            resultSet = resultSet.intersection(set)
        }
        for id in resultSet {
            let product = productDataSource.first(where:{$0.id == id})
            tmpShownProducts.append(product!)
        }
    }
}


//MARK:- Called by View
extension MapPresenter: ViewableProductPresenter {
    
    func productNumberSections() -> Int {
        return 1
    }
    
    func productNumberOfRowsInSection() -> Int {
        return tmpShownProducts.count
    }
    
    func productGetData(indexPath: IndexPath) -> Product? {
        return tmpShownProducts[indexPath.row]
    }
    
    func productGetIndexPath(product: Product) -> IndexPath?{
        if let idx = tmpShownProducts.firstIndex(where: {$0.id == product.id}) {
            return IndexPath(row: idx, section: 0)
        }
        return nil
    }
    
    func productSort(by sortEnum: SortEnum) {
        guard tmpShownProducts.count > 0 else { return }
        switch sortEnum {
        case .popularity:
            tmpShownProducts = tmpShownProducts.sorted {
                $0.popularity > $1.popularity
            }
        case .priceDown:
            tmpShownProducts = tmpShownProducts.sorted {
                $0.price < $1.price
            }
        case .priceUp:
            tmpShownProducts = tmpShownProducts.sorted {
                $0.price > $1.price
            }
        default:
            tmpShownProducts = tmpShownProducts.sorted {
                $0.name < $1.name
            }
        }
    }
    
    func productSearchTextDidBeginEditing() {
        tmpShownProductsWhenSearching = tmpShownProducts
    }
    
    func productSearchTextDidChange(textSearch: String) {
        
        if textSearch == "" {
            tmpShownProducts = tmpShownProductsWhenSearching
        } else {
            let searched = productDataSource.filter{$0.desc.lowercased().range(of: textSearch.lowercased()) != nil }
            if searched.isEmpty == false {
                tmpShownProducts = searched
            }
        }
        view?.productReloadData()
    }
}


//MARK:- Called by Sync
extension MapPresenter {
    
}
