import Foundation


class MapPresenter {
    
    
    static var shared = MapPresenter()
    
    weak var view: PresentableView?
    var mapSync: PresentableMapSync = MapSync.shared
    
    
//MARK:- datasources
    
    var categoryDataSource: [Category] = Category.list()
    var filterDataSource: [Filter] = []
    var productDataSource: [Product] = Product.list0() + Product.list1()
    
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
    
    
    private init() {
        mapSync.syncFilter(onSuccess: getOnSuccessFilter(),
                           onError: getOnErrorFilter())
    }
}


extension MapPresenter: ViewableMapPresenter {
    
    func setView(view: PresentableView) {
        self.view = view
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
