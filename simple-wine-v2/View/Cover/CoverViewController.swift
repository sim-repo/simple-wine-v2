import UIKit


class CoverViewController: UIViewController {
    
    var coverView: CoverView?
    
    var presenter: ViewableCoverPresenter {
        CoverPresenter.shared.setView(view: self)
        return CoverPresenter.shared
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let pointEnum = presenter.getPointEnum()
        switch pointEnum {
        case .grandcru:
            coverView = GrandCruCover.nib()
            coverView?.delegate = self
        default:
            coverView = GrandCruCover.nib()
        }
    }
}

//MARK:- Cover Delegate

extension CoverViewController: CoverDelegate {
    
    func didPressEnter() {
        presenter.didPressEnter()
    }
    
    func didPressLogout() {
        presenter.didLogout()
    }
}

//MARK:- PresentableCoverView

extension CoverViewController: PresentableCoverView {
    
    func enter() {
        performSegue(withIdentifier: "showMapSegue", sender: nil)
    }
    
    func logout() {
        
    }
}
