import Foundation

protocol DetailMapPresenterDelegate {
    func getAttributeName(kindId: Int, productAttributeIds: [Int]) -> String
    func favouriteDidPressLike(product: Product, isLike: Bool)
}

class DetailMapPresenter {
    
    var product: Product?
    var detailMapSetting: DetailMapSetting?
    var delegate: DetailMapPresenterDelegate?
}


extension DetailMapPresenter: ViewableDetailMapPresenter {
    
    func getProduct() -> Product? {
        return product
    }
    
    
    func getAttribute() -> String {
        var attributes = ""
        guard let kindIds = detailMapSetting?.kindIds else { return ""}
        for (row, kindId) in kindIds.enumerated() {
            let attributeName = getAttributeName(kindId)
            if attributeName != "" {
                if let prefix = detailMapSetting?.prefix[row] {
                    attributes += prefix + ": " + attributeName+"\n\n"
                } else {
                    attributes += attributeName+"\n\n"
                }
            }
        }
        return attributes
    }
    
    
    private func getAttributeName(_ kindId: Int) -> String {
        if let productAttributeIds = product?.attributeIds {
            let attributeName = delegate?.getAttributeName(kindId: kindId, productAttributeIds: productAttributeIds) ?? ""
            return attributeName
        }
        return ""
    }
    
    func favouriteDidPressLike(isLike: Bool) {
        guard let product = product else { return }
        product.isLiked = isLike
        delegate?.favouriteDidPressLike(product: product, isLike: isLike)
    }
    
}
