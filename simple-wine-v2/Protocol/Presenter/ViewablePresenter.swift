import Foundation


//MARK:- Map
protocol ViewableMapPresenter {
    func setView(view: PresentableMapView)
    func getMainTitle() -> String
    func back()
}


protocol ViewableCategoryPresenter {
    func categoryNumberOfRowsInSection() -> Int
    func categoryGetData(indexPath: IndexPath) -> Category?
    func categoryGetIndexPath(category: Category) -> IndexPath?
    func categoryIsSelected(indexPath: IndexPath) -> Bool
    
    func categoryDidPress(at indexPath: IndexPath)
}


protocol ViewableFilterPresenter {
    func filterNumberOfSections() -> Int
    func filterNumberOfRowsInSection(section: Int) -> Int
    func filterGetData(indexPath: IndexPath) -> Filter?
    func filterGetIndexPath(category: Category) -> IndexPath?
    func filterGetSectionTitle(section: Int) -> String
    func filterIsSelected(filter: Filter) -> Bool
    func filterGetItemsByFilter(filter: Filter) -> Int
    
    func filterDidPress(at indexPath: IndexPath)
}


protocol ViewableProductPresenter {
    func productNumberSections() -> Int
    func productNumberOfRowsInSection(section: Int) -> Int
    func productGetData(indexPath: IndexPath) -> Product?
    func productGetIndexPath(product: Product) -> IndexPath?
    func getSectionTitle(section: Int) -> String
    
    func productSearchTextDidBeginEditing()
    func productSearchTextDidChange(textSearch: String)
    func productDidPressDetail(indexPath: IndexPath)
}


protocol ViewableFavouriteMapPresenter {
    func getFavouriteNumber() -> Int
    func favouriteDidPress()
}


//MARK:- Detail Map
protocol ViewableDetailMapPresenter {
    func getAttribute() -> String
    func getProduct() -> Product?
    
    func favouriteDidPressLike(isLike: Bool)
}



//MARK:- Favourite
protocol ViewableFavouritePresenter {
    
    func numberOfSections() -> Int
    func numberOfRowsInSection(section: Int) -> Int
    func getData(indexPath: IndexPath) -> Product?
    func getIndexPath(product: Product) -> IndexPath?
    func getSectionTitle(section: Int) -> String
    
    func setView(view: PresentableFavouriteView) 
    func productDidPressDetail(indexPath: IndexPath)
    func removeAll()
}


//MARK:- Detail Favourite
protocol ViewableDetailFavouritePresenter {
    func getAttribute() -> String
    func getProduct() -> Product?
}



//MARK:- Cover
protocol ViewableCoverPresenter {
    func setView(view: PresentableCoverView)
    func getPointEnum() -> PointEnum
    
    func didPressEnter()
    func didLogout()
}


//MARK:- Point Menu
protocol ViewablePointMenuPresenter {
    func setView(view: PresentablePointMenuView)
    func didPressEnter(pointEnum: PointEnum)
}


//MARK:- Auth
protocol ViewableAuthPresenter {
    func setView(view: PresentableAuthView)
    func getLogoImageURL() -> String
    
    func didPressSignIn(login: String, password: String)
}


//MARK:- Map Menu
protocol ViewableMapMenuPresenter {
    func setView(view: PresentableMapMenuView)
    func getLogoImageURL() -> String
    func didPressEnter(menuMapEnum: MenuMapEnum)
}
