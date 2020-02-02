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
    var selectedFilter: [SelectedFilter] = []

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
    
    
    
    private init() {
        mapSync.syncFilter(onSuccess: getOnSuccessFilter(),
                           onError: getOnErrorFilter())
    }
}


extension MapPresenter: ViewableMapPresenter {

    func setView(view: PresentableMapView) {
        self.view = view
    }
}


extension MapPresenter: ViewableFavouriteMapPresenter {
    
    func getFavouriteNumber() -> Int {
        return favourites.count
    }
    
    func favouriteDidPress() {
        print(favourites.count)
        let favouritePresenter = FavouritePresenter(favourites: favourites, categoryDataSource: categoryDataSource)
        view?.performFavouriteSegue(presenter: favouritePresenter)
    }
}

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

extension MapPresenter: SortablePresenter {
    func didSortSelect(sortEnum: SortEnum) {
        productSort(by: sortEnum)
        view?.productReloadData()
    }
}



extension MapPresenter: DetailMapPresenterDelegate {
    
    func getAttributeName(kindId: Int, productAttributeIds: [Int]) -> String {
        
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
    
    func favouriteDidPressLike(product: Product, isLike: Bool) {
        if isLike {
            if favourites.contains(where: {$0.id == product.id}) == false {
                favourites.append(product)
            }
        } else {
            favourites = favourites.filter({$0.id != product.id})
        }
        
        view?.favouriteNumberReload(number: favourites.count)
    }
}