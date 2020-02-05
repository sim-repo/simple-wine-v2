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
    var selectedFilters: [SelectedFilter] = []
    
    //MARK:- filter
    var tmpShownFilter: [Filter] = []
    var tmpFilterSectionTitle: [Int:String] = [:] //section: parent title
    var tmpFilterSection: [IndexPath:Filter] = [:]
    
    //MARK:- product
    var tmpShownProducts: [Product] = [] //product id: Product
    var tmpShownProductsWhenSearching: [Product] = [] // used when searching
    
    //MARK:- category
    var currentCategoryId = 0
    
    //MARK:- favourites
    var favourites: [Product] = []
    
    //MARK:- sorting
    var currentSortEnum: SortEnum = .ourCase
    
    
    private init() {}
    
    func setup(pointEnum: PointEnum) {
        self.currentPointEnum = pointEnum
    }
    
    
    func preload(pointEnum: PointEnum) {
        if currentPointEnum == nil {
            currentPointEnum = pointEnum
        }
        SERIAL_THREAD { [weak self] in
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
}


//MARK:- Viewable

extension MapPresenter: ViewableMapPresenter {
    func setView(view: PresentableMapView) {
        self.view = view
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




//MARK:- Syncable

extension MapPresenter: SyncableMapPresenter {
    
    func setAllDataSources(pointEnum: PointEnum,
                           categories: [Category],
                           filters: [Filter],
                           products: [Product],
                           detailMapSettings: [DetailMapSetting]) {
        currentPointEnum = pointEnum
        categoryDataSource = categories
        filterDataSource = filters
        productDataSource = products
        detailMapSettingDataSource = detailMapSettings
        resetShownFilters()
        prepareFilterSection()
        fillAll()
    }

    
    func setFilterDataSource(filters: [Filter]) {
        filterDataSource = filters
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

