import Foundation


protocol PresentableMapView: class {
    func filterReloadData()
    func productReloadData()
    func selectedFilterReloadData()
    func categoryReloadData()
    func performMapDetailSegue(presenter: DetailMapPresenter)
    func performFavouriteSegue(presenter: FavouritePresenter)
    func favouriteNumberReload(number: Int)
}




protocol PresentableFavouriteView: class {
    func reloadData()
    func performFavouriteDetailSegue(presenter: FavouriteDetailPresenter)
}
