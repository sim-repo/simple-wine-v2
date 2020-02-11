import UIKit


class MapPresenter {
    
    static var shared = MapPresenter()
    
    weak var view: PresentableMapView?
    
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
    var tmpShownProductsWhenSearching: [Product] = [] // used when searching
    
    var tmpShownProductsByFilter = [IndexPath: Product]()
    var tmpShownProductSectionTitle: [Int:String] = [:] //section: parent title
    
    //MARK:- category
    var currentCategoryId = 0
    
    //MARK:- favourites
    var favourites: [Product] = []
    
    //MARK:- selected map: classic or price
    var menuMapEnum: MenuMapEnum = .classic
    
    //MARK:- items by filter
    var itemsByFilter: [Int : [Int]] = [:]
    
    
    private init(){}

    func setup(menuMapEnum: MenuMapEnum) {
        self.menuMapEnum = menuMapEnum
    }
    
    func calcItemsPerFilter() {
        let attributes = productDataSource.filter({$0.pointEnum == currentPointEnum}).flatMap({$0.attributeIds})
        itemsByFilter = Dictionary(grouping: attributes, by: { $0 })
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
        categoryDidPress(at: IndexPath(row: 0, section: 0 ))
        guard let selected = selectedFilter else { return }
        self.view?.setFilterTitle(title: selected.title, volume: selected.volume.rawValue + " л")
    }
    
    func back() {
        selectedFilter = nil
        tmpShownProductsWhenSearching.removeAll()
        tmpShownFilter.removeAll()
        tmpFilterSectionTitle.removeAll()
        tmpFilterSection.removeAll()
        tmpShownProductsByFilter.removeAll()
        tmpShownProductSectionTitle.removeAll()
    }
}

//MARK:- Viewable Favourite

extension MapPresenter: ViewableFavouriteMapPresenter {
    
    func getFavouriteNumber() -> Int {
        return favourites.count
    }
    
    func favouriteDidPress() {
        let favouritePresenter = FavouritePresenter(favourites: favourites, delegate: self)
        view?.performFavouriteSegue(presenter: favouritePresenter)
    }
}




//MARK:- Setterable

extension MapPresenter: SetterableMapPresenter {
    
    func setMapMenu(menuMapEnum: MenuMapEnum) {
        self.menuMapEnum = menuMapEnum
    }

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
        calcItemsPerFilter()
    }
    
    func clear() {
        selectedFilter = nil
        categoryDataSource.removeAll()
        filterDataSource.removeAll()
        productDataSource.removeAll()
        detailMapSettingDataSource.removeAll()

        tmpShownProductsWhenSearching.removeAll()
        tmpShownFilter.removeAll()
        tmpFilterSectionTitle.removeAll()
        tmpFilterSection.removeAll()
        tmpShownProductsByFilter.removeAll()
        tmpShownProductSectionTitle.removeAll()
    }
    
    func favouritesClear() {
        favourites.removeAll()
    }
}


//MARK:- Favourite Presenter Delegate

extension MapPresenter: FavouritePresenterDelegate {
    
    func favouritesRemoveAll() {
        for product in productDataSource {
            product.isLiked = false
        }
        favourites.removeAll()
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



extension MapPresenter: BackgroundableMapPresenter {
    func bkgPopToMapMenuView() {
        view?.bkgPopToMapMenuView()
    }
    
    func bkgPopToCoverMenuView() {
        view?.bkgPopToCoverMenuView()
    }
    
    func bkgPopToRootView() {
        view?.bkgPopToRootView()
    }
}
