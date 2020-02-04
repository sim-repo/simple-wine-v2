import Foundation

protocol SyncableMapPresenter {
    
    func setAllDataSources(pointEnum: PointEnum,
                           categories: [Category],
                           filters: [Filter],
                           products: [Product],
                           detailMapSettings: [DetailMapSetting])
    
    
    
    func setCategoryDataSource(categories: [Category])
    func setFilterDataSource(filters: [Filter])
    func setProductDataSource(products: [Product])
}
