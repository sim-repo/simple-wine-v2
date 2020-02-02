import Foundation


protocol PresentableView: class {
    func filterReloadData()
    func productReloadData()
    func selectedFilterReloadData()
    func categoryReloadData()
    func performMapDetailSegue(presenter: DetailMapPresenter)
}
