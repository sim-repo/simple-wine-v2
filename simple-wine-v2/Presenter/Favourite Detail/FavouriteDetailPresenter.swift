import Foundation


protocol FavouriteDetailPresenterDelegate {
    func getAttributeName(kindId: Int, productAttributeIds: [Int]) -> String
}


class FavouriteDetailPresenter {
    
    var product: Product
    var detailMapSetting: DetailMapSetting
    var delegate: FavouriteDetailPresenterDelegate
    
    init(product: Product, detailMapSetting: DetailMapSetting, delegate: FavouriteDetailPresenterDelegate) {
        self.product = product
        self.detailMapSetting = detailMapSetting
        self.delegate = delegate
    }
}


extension FavouriteDetailPresenter: ViewableDetailFavouritePresenter {
    
    func getProduct() -> Product? {
        return product
    }
    
    func getAttribute() -> String {
        
        var attributes = ""
        let kindIds = detailMapSetting.kindIds
        for (row, kindId) in kindIds.enumerated() {
            let attributeName = getAttributeName(kindId)
            if attributeName != "" {
                let prefix = detailMapSetting.prefix[row]
                if prefix != "" {
                    attributes += prefix + ": " + attributeName+"\n\n"
                } else {
                    attributes += attributeName+"\n\n"
                }
            }
        }
        return attributes
    }
    
    
    private func getAttributeName(_ kindId: Int) -> String {
        let productAttributeIds = product.attributeIds
        let attributeName = delegate.getAttributeName(kindId: kindId, productAttributeIds: productAttributeIds)
        return attributeName
    }
}
