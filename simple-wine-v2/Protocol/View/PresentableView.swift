import Foundation


//MARK:- Map View

protocol PresentableMapView: class {
    func filterReloadData()
    func productReloadData()
    func productReloadData(at indexPath: IndexPath)
    func selectedFilterReloadData()
    func categoryReloadData()
    func performMapDetailSegue(presenter: DetailMapPresenter)
    func performFavouriteSegue(presenter: FavouritePresenter)
    func favouriteNumberReload(number: Int)
}


//MARK:- Favourite View

protocol PresentableFavouriteView: class {
    func reloadData()
    func performFavouriteDetailSegue(presenter: ViewableDetailFavouritePresenter)
}


//MARK:- Cover View

protocol PresentableCoverView: class {
    func enter()
    func logout()
}


//MARK:- Auth View

protocol PresentableAuthView: class {
    func enter()
}


//MARK:- Point View

protocol PresentablePointMenuView: class {
    func enter()
    func startWaitIndicator()
    func stopWaitIndicator()
    func showAlert(text: String)
}
