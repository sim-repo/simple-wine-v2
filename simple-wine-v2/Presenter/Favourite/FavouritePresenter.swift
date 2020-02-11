import Foundation


protocol FavouritePresenterDelegate {
    func favouritesRemoveAll()
}


class FavouritePresenter {
    
    weak var view: PresentableFavouriteView?
    var favourites: [Product] = []
    var delegate: FavouritePresenterDelegate
    
    init(favourites: [Product], delegate: FavouritePresenterDelegate ) {
        self.favourites = favourites
        self.delegate = delegate
    }
}



extension FavouritePresenter: ViewableFavouritePresenter {
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection() -> Int {
        return favourites.count
    }
    
    func getData(indexPath: IndexPath) -> Product? {
        return favourites[indexPath.row]
    }
    
    func setView(view: PresentableFavouriteView) {
        self.view = view
    }
    
    func productDidPressDetail(indexPath: IndexPath) {
        let product = favourites[indexPath.row]
        let favouriteDetailPresenter = FavouriteDetailPresenter(product: product)
        view?.performFavouriteDetailSegue(presenter: favouriteDetailPresenter)
    }
    
    func removeAll() {
        delegate.favouritesRemoveAll()
    }
}
