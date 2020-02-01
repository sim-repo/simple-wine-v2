import Foundation



protocol ViewableMapPresenter {
    func setView(view: PresentableView)
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
}

protocol ViewableSelectedFilterPresenter {
    func selectedFilterNumberOfRowsInSection() -> Int
    func selectedFilterGetData(indexPath: IndexPath) -> SelectedFilter?
    func selectedFilterGetIndexPath(selecteFilter: SelectedFilter) -> IndexPath?
    
    func selectedFilterCancelDidPress(at indexPath: IndexPath)
}
