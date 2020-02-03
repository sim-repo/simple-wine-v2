import UIKit



protocol CoverView: UIView {
    var delegate: CoverDelegate? {get set}
}


protocol CoverDelegate {
    func didPressEnter()
    func didPressLogout()
}

