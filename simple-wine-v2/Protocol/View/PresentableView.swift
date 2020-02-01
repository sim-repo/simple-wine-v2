import Foundation


protocol PresentableView: class {
    func filterReloadData()
    func productReloadData()
    func selectedFilterReloadData()
    func categoryReloadData()
}
