import UIKit


class CoverViewController: UIViewController {
    

    
    var presenter: ViewableCoverPresenter {
        CoverPresenter.shared.setView(view: self)
        return CoverPresenter.shared
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let pointEnum = presenter.getPointEnum()
        switch pointEnum {
        case .grandcru:
            let coverView = GrandCruCover.nib()
            setupCover(coverView)
        case .kuznetskiymost:
            let coverView = KuznetskyCover.nib()
            setupCover(coverView)
        case .depo:
            let coverView = DepoCover.nib()
            setupCover(coverView)
        default:
            let coverView = GrandCruCover.nib()
            setupCover(coverView)
        }
    }
    
    
    private func setupCover(_ coverView: CoverView) {
        coverView.translatesAutoresizingMaskIntoConstraints = false
        coverView.setupOutlets()
        coverView.delegate = self
        view.addSubview(coverView)
        coverView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        coverView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        coverView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        coverView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
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
        navigationController?.popViewController(animated: true)
    }
}
