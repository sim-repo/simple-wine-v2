import Foundation


class MapPresenter {
    
    private init(){}
    static var shared = MapPresenter()
    
//MARK:- datasources
    
    var categoryDataSource: [Category] = Category.list()
    var filterDataSource: [Filter] = Filter.list()
    var productDataSource: [Product] = Product.list()
    
//MARK:- selected filters
    var selectedFilter: [SelectedFilter] = SelectedFilter.list()
    var shownFilter: [Filter] = []
    
}


