import Foundation


class MapPresenter {
    
    
    static var shared = MapPresenter()
    
    weak var view: PresentableView?
    var mapSync: PresentableMapSync = MapSync.shared
    
    
//MARK:- datasources
    
    var categoryDataSource: [Category] = Category.list()
    var filterDataSource: [Filter] = []
    var productDataSource: [Product] = Product.list()
    
//MARK:- selected filters
    var selectedFilter: [SelectedFilter] = SelectedFilter.list()
    var shownFilter: [Filter] = []
    
    

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
        view?.filterReloadData()
    }
    
    func setCategoryDataSource(categories: [Category]) {
        categoryDataSource = categories
    }
    
    func setProductDataSource(products: [Product]) {
        productDataSource = products
    }
}
