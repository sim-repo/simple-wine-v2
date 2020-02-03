import UIKit


class CoverView: UIView {
    var delegate: CoverDelegate?
    func setupOutlets() {
        fatalError("method must be implemented")
    }
}


protocol CoverDelegate {
    func didPressEnter()
    func didPressLogout()
}

