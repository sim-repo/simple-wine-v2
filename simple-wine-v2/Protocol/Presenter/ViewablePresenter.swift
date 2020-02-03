import Foundation


//MARK:- Map
protocol ViewableMapPresenter {
    func setView(view: PresentableMapView)
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
    
    func filterDidPress(at indexPath: IndexPath)
    func titleDidPress(at indexPath: IndexPath)
}


protocol ViewableProductPresenter {
    func productNumberSections() -> Int
    func productNumberOfRowsInSection() -> Int
    func productGetData(indexPath: IndexPath) -> Product?
    func productGetIndexPath(product: Product) -> IndexPath?
    
    func productSearchTextDidBeginEditing()
    func productSearchTextDidChange(textSearch: String)
    func productDidPressDetail(indexPath: IndexPath)
}


protocol ViewableSelectedFilterPresenter {
    func selectedFilterNumberOfRowsInSection() -> Int
    func selectedFilterGetData(indexPath: IndexPath) -> SelectedFilter.InnerFilter?
    func selectedFilterGetIndexPath(selecteFilter: SelectedFilter.InnerFilter) -> IndexPath?
    
    func selectedFilterCancelDidPress(at indexPath: IndexPath)
}

protocol ViewableFavouriteMapPresenter {
    func getFavouriteNumber() -> Int
    func favouriteDidPress()
}


//MARK:- DetailMap
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
