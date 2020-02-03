import Foundation


class MapPresenter {
    
    
    static var shared = MapPresenter()
    
    weak var view: PresentableMapView?
    var mapSync: PresentableMapSync = MapSync.shared
    
    
    //MARK:- datasources
    var categoryDataSource: [Category] = Category.list()
    var filterDataSource: [Filter] = []
    var productDataSource: [Product] = Product.list0() + Product.list1()
    var detailMapSettingDataSource: [DetailMapSetting] = DetailMapSetting.list()
    
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
    
    
    private init() {
        mapSync.syncFilter(onSuccess: getOnSuccessFilter(),
                           onError: getOnErrorFilter())
        
        fillAll()
    }
    
    func fillAll() {
        tmpShownProducts = productDataSource.filter{ $0.categoryId == currentCategoryId}
        productSort(by: currentSortEnum)
    }
}



//MARK:- ViewableMapPresenter

extension MapPresenter: ViewableMapPresenter {
    func setView(view: PresentableMapView) {
        self.view = view
    }
}


//MARK:- ViewableFavouriteMapPresenter

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




//MARK:- SyncableMapPresenter

extension MapPresenter: SyncableMapPresenter {
    
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


//MARK:- SortablePresenter

extension MapPresenter: SortablePresenter {
    func didSortSelect(sortEnum: SortEnum) {
        currentSortEnum = sortEnum
        productSort(by: sortEnum)
        view?.productReloadData()
    }
}

//MARK:- FavouritePresenterDelegate

extension MapPresenter: FavouritePresenterDelegate {
    func getFavouriteAttributeName(_ kindId: Int, _ productAttributeIds: [Int]) -> String {
         return searchAttributeName(kindId, productAttributeIds)
    }
}

//MARK:- DetailMapPresenterDelegate

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


//MARK:- MapPresenter

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
