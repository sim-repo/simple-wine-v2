import Foundation


class MapPresenter {
    
    
    static var shared = MapPresenter()
    
    weak var view: PresentableMapView?
    var mapSync: PresentableMapSync = MapSync.shared
    
    //MARK:-
    var currentPointEnum: PointEnum!
    
    //MARK:- datasources
    var categoryDataSource: [Category] = []
    var filterDataSource: [Filter] = []
    var productDataSource: [Product] = []
    var detailMapSettingDataSource: [DetailMapSetting] = []
    
    //MARK:- selected filter
    var selectedFilter: Filter!
    
    //MARK:- filter
    var tmpShownFilter: [Filter] = []
    var tmpFilterSectionTitle: [Int:String] = [:] //section: parent title
    var tmpFilterSection: [IndexPath:Filter] = [:]
    
    //MARK:- product
    var tmpShownProducts: [Product] = [] //product id: Product
    var tmpShownProductsWhenSearching: [Product] = [] // used when searching
    
    var tmpShownProductsByFilter = [IndexPath: Product]()
    var tmpShownProductSectionTitle: [Int:String] = [:] //section: parent title
    
    //MARK:- category
    var currentCategoryId = 0
    
    //MARK:- favourites
    var favourites: [Product] = []
    
    //MARK:- sorting
    var currentSortEnum: SortEnum = .ourCase
    
    //MARK:- selected map: classic or price
    var menuMapEnum: MenuMapEnum = .classic
    
    
    private init() {}
   
    
    func preload(pointEnum: PointEnum) {
        if currentPointEnum == nil {
            currentPointEnum = pointEnum
        }
        ThreadConstant.SERIAL_THREAD { [weak self] in
            guard let self = self else { return }
            self.mapSync.syncFilter(pointEnum: self.currentPointEnum,
                                    onSuccess: self.getOnSuccessFilter(),
                                    onError: self.getOnErrorFilter())
        }
    }
    
    func fillAll() {
        tmpShownProducts = productDataSource.filter{ $0.categoryId == currentCategoryId}
        productSort(by: currentSortEnum)
    }
    
    func setup(menuMapEnum: MenuMapEnum) {
        self.menuMapEnum = menuMapEnum
    }
}


//MARK:- Viewable

extension MapPresenter: ViewableMapPresenter {
    
    func getMainTitle() -> String {
        switch menuMapEnum {
        case .classic:
            return "Классическая винная карта"
        default:
            return "Винная карта по цене"
        }
    }
    
    func setView(view: PresentableMapView) {
        self.view = view
        selectedFilter = filterDataSource.first
        resetShownFilters()
        prepareFilterSection()
        prepareProduct()
        self.view?.setFilterTitle(title: selectedFilter.title, volume: selectedFilter.volume.rawValue)
    }
    
    func back() {
        selectedFilter = nil
        tmpShownProducts.removeAll()
        tmpShownProductsWhenSearching.removeAll()
        tmpShownFilter.removeAll()
        tmpFilterSectionTitle.removeAll()
        tmpFilterSection.removeAll()
    }
}

//MARK:- Viewable Favourite

extension MapPresenter: ViewableFavouriteMapPresenter {
    
    func getFavouriteNumber() -> Int {
        return favourites.count
    }
    
    func favouriteDidPress() {
        let favouritePresenter = FavouritePresenter(favourites: favourites,
                                                    categoryDataSource: categoryDataSource,
                                                    delegate: self,
                                                    detailMapSettings: detailMapSettingDataSource)
        view?.performFavouriteSegue(presenter: favouritePresenter)
    }
}




//MARK:- Setterable

extension MapPresenter: SetterableMapPresenter {
    
    
    func setCurrentPoint(pointEnum: PointEnum) {
        self.currentPointEnum = pointEnum
    }
    
    func setAllDataSources(categories: [Category],
                           filters: [Filter],
                           products: [Product],
                           detailMapSettings: [DetailMapSetting]) {
        categoryDataSource = categories
        filterDataSource = filters
        productDataSource = products
        detailMapSettingDataSource = detailMapSettings
        selectedFilter = filters.first
    }

    
    func setFilterDataSource(filters: [Filter]) {
        filterDataSource = filters
        selectedFilter = filters.first
        resetShownFilters()
        prepareFilterSection()
        view?.filterReloadData()
    }
    
    func setCategoryDataSource(categories: [Category]) {
        categoryDataSource = categories
    }
    
    func setProductDataSource(products: [Product]) {
        productDataSource = products
    }
}


//MARK:- Sortable

extension MapPresenter: SortablePresenter {
    func didSortSelect(sortEnum: SortEnum) {
        currentSortEnum = sortEnum
        productSort(by: sortEnum)
        view?.productReloadData()
    }
}

//MARK:- Favourite Presenter Delegate

extension MapPresenter: FavouritePresenterDelegate {
    func getFavouriteAttributeName(_ kindId: Int, _ productAttributeIds: [Int]) -> String {
         return searchAttributeName(kindId, productAttributeIds)
    }
}

//MARK:- Detail Map Presenter Delegate

extension MapPresenter: DetailMapPresenterDelegate {
    
    func getAttributeName(kindId: Int, productAttributeIds: [Int]) -> String {
        return searchAttributeName(kindId, productAttributeIds)
    }
    
    func favouriteDidPressLike(product: Product, isLike: Bool) {
        
        product.isLiked = isLike
        
        if isLike {
            if favourites.contains(where: {$0.id == product.id}) == false {
                favourites.append(product)
            }
        } else {
            favourites = favourites.filter({$0.id != product.id})
        }
        view?.favouriteNumberReload(number: favourites.count)
        if let indexPath = productGetIndexPath(product: product) {
            view?.productReloadData(at: indexPath)
        }
    }
}


//MARK:- Attributes

extension MapPresenter {
    
    private func searchAttributeName(_ kindId: Int, _ productAttributeIds: [Int]) -> String {
        var buffer: [Int:String] = [:]
        for attributeId in productAttributeIds {
            if let (level, name) = searchRequired(kindId: kindId, attributeId: attributeId) {
                buffer[level] = name
            }
        }
        let x = buffer.max{a, b in a.key < b.key}
        return x?.value ?? ""
    }
    
    private func searchRequired(kindId: Int, attributeId: Int) -> (Int,String)? {
        if let filter = filterDataSource.first(where: {$0.kindId == kindId && $0.id == attributeId}) {
            return (filter.level, filter.title)
        }
        return nil
    }
}

