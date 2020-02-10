import Foundation


protocol FavouritePresenterDelegate {
    func getFavouriteAttributeName(_ kindId: Int, _ productAttributeIds: [Int]) -> String
}


class FavouritePresenter {
    
    weak var view: PresentableFavouriteView?
    
    var favourites: [Product] = []
    
    var categoryDataSource: [Category]?
    
    var productsByCategory = [IndexPath: Product]()
    var sectionTitle = [Int:String]() //section:title
    var detailMapSettings: [DetailMapSetting]
    
    var delegate: FavouritePresenterDelegate
    
    
    init(favourites: [Product], categoryDataSource: [Category], delegate: FavouritePresenterDelegate, detailMapSettings: [DetailMapSetting]) {
        self.categoryDataSource = categoryDataSource
        self.favourites = favourites
        self.delegate = delegate
        self.detailMapSettings = detailMapSettings
        fillProductsByCategory(favourites: favourites)
        fillSectionTitle(favourites: favourites)
    }
    
    private func getCategoryTitle(by categoryId: Int) -> String {
        let category = categoryDataSource?.first(where: {$0.id == categoryId})
        return category?.title ?? ""
    }
    
    private func fillSectionTitle(favourites: [Product]) {
        sectionTitle = favourites.reduce(into: [Int: String]()) {
            $0[$1.categoryId] =  getCategoryTitle(by: $1.categoryId)
        }
    }
    
    private func fillProductsByCategory(favourites: [Product]) {
        
        let groupByCategory = favourites.group(by: \Product.categoryId)
        
        for item in groupByCategory {
               let section = item.key
               let products = item.values
               
               for (row, val) in products.enumerated() {
                   productsByCategory[IndexPath(row: row, section: section)] = val
               }
        }
    }
}



extension FavouritePresenter: ViewableFavouritePresenter {
    
    
    func numberOfSections() -> Int {
        sectionTitle.count > 0 ? sectionTitle.count : 1
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        let items = productsByCategory.filter{$0.key.section == section}
        return items.count
    }
    
    func getData(indexPath: IndexPath) -> Product? {
        return productsByCategory[indexPath]
    }
    
    func getIndexPath(product: Product) -> IndexPath? {
        let dict = productsByCategory.first(where: {$0.value.id == product.id})
        return dict?.key
    }
    
    func getSectionTitle(section: Int) -> String {
        guard sectionTitle.count > 0
            else {
                return ""
        }
        return sectionTitle[section] ?? ""
    }
    
    
    func setView(view: PresentableFavouriteView) {
        self.view = view
    }
    
    func productDidPressDetail(indexPath: IndexPath) {
        guard let product = getData(indexPath: indexPath) else { return }
        guard let detailMapSetting = detailMapSettings.first(where: {$0.categoryId == product.categoryId}) else { return }
        
        let favouriteDetailPresenter = FavouriteDetailPresenter(product: product, detailMapSetting: detailMapSetting, delegate: self)
        view?.performFavouriteDetailSegue(presenter: favouriteDetailPresenter)
    }
}


extension FavouritePresenter: FavouriteDetailPresenterDelegate {
    func getAttributeName(kindId: Int, productAttributeIds: [Int]) -> String {
        return delegate.getFavouriteAttributeName(kindId, productAttributeIds)
    }
}
