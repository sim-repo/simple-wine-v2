import Foundation

protocol DetailMapPresenterDelegate {
    func getAttributeName(kindId: Int, productAttributeIds: [Int]) -> String
}

class DetailMapPresenter {
    
    var product: Product?
    var detailMapSetting: DetailMapSetting?
    var delegate: DetailMapPresenterDelegate?
}


extension DetailMapPresenter: ViewableDetailMapPresenter {
    
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
    
}
