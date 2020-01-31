import Foundation

protocol SyncableMapPresenter {
    func setFilterDataSource(filters: [Filter])
    func setCategoryDataSource(categories: [Category])
    func setProductDataSource(products: [Product])
}
