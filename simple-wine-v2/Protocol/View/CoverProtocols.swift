import UIKit



class CoverView: UIView {
    var delegate: CoverDelegate?
}


protocol CoverDelegate {
    func didPressEnter()
    func didPressLogout()
}

