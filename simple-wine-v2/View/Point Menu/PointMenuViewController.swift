import UIKit


class PointMenuViewController: UIViewController {
    
    @IBOutlet weak var grandcruButton: UIButton!
    @IBOutlet weak var kuznetskyButton: UIButton!
    @IBOutlet weak var depoButton: UIButton!
    
    var inTransition = false
    
    var waiter: SpinnerViewController?
    
    var presenter: ViewablePointMenuPresenter {
        PointMenuPresenter.shared.setView(view: self)
        return PointMenuPresenter.shared
    }
    
    override func viewWillAppear(_ animated: Bool) {
        inTransition = false
    }
    
    override func viewDidLoad() {
        setupButtons()
        let _ = presenter
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
        guard inTransition == false else { return }
        inTransition = true
        presenter.didPressEnter(pointEnum: .grandcru)
    }
    
    @IBAction func pressKuznetsky(_ sender: Any) {
        guard inTransition == false else { return }
        inTransition = true
        presenter.didPressEnter(pointEnum: .kuznetskiymost)
    }
    
    @IBAction func pressDepo(_ sender: Any) {
        guard inTransition == false else { return }
        inTransition = true
        presenter.didPressEnter(pointEnum: .depo)
    }
}

extension PointMenuViewController: PresentablePointMenuView {

    func enter() {
        performSegue(withIdentifier: "showAuthSegue", sender: nil)
    }
    
    func startWaitIndicator() {
        waiter = SpinnerViewController(vc: self)
        waiter?.add(vcView: view)
    }
    
    func stopWaitIndicator() {
        waiter?.stop(vcView: view)
    }
    
    func showAlert(text: String) {
        let alert = UIAlertController(title: "Что-то пошло не так..",
                                      message: text,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}


