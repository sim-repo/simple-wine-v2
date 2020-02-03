import UIKit


class PointMenuViewController: UIViewController {
    
    @IBOutlet weak var grandcruButton: UIButton!
    @IBOutlet weak var kuznetskyButton: UIButton!
    @IBOutlet weak var depoButton: UIButton!
    
    var presenter: ViewablePointMenuPresenter {
        PointMenuPresenter.shared.setView(view: self)
        return PointMenuPresenter.shared
    }
    
    override func viewDidLoad() {
        setupButtons()
    }
    
    private func setupButtons(){
        let image = getSystemImage(name: "arrow.right.circle", pointSize: Theme.buttonSize, color: Theme.buttonArrowColor)
        grandcruButton.setImage(image, for: .normal)
        
        let image2 = getSystemImage(name: "arrow.right.circle", pointSize: Theme.buttonSize, color: Theme.buttonArrowColor)
        kuznetskyButton.setImage(image2, for: .normal)
        
        let image3 = getSystemImage(name: "arrow.right.circle", pointSize: Theme.buttonSize, color: Theme.buttonArrowColor)
        depoButton.setImage(image3, for: .normal)
    }
    

    @IBAction func pressGrandCru(_ sender: Any) {
        presenter.didPressEnter(pointEnum: .grandcru)
    }
    
    @IBAction func pressKuznetsky(_ sender: Any) {
        presenter.didPressEnter(pointEnum: .kuznetskiymost)
    }
    
    @IBAction func pressDepo(_ sender: Any) {
        presenter.didPressEnter(pointEnum: .depo)
    }
}


extension PointMenuViewController: PresentablePointMenuView {
    
    func enter() {
        performSegue(withIdentifier: "showAuthSegue", sender: nil)
    }
}
