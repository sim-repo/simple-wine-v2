import Foundation


class FavouriteDetailPresenter {
    
    var product: Product

    init(product: Product) {
        self.product = product
    }
}


extension FavouriteDetailPresenter: ViewableDetailFavouritePresenter {
    func getProduct() -> Product? {
        return product
    }
}
