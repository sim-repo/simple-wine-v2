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
        setupNotification()
    }
   
    
    private func setupButtons(){
        grandcruButton.setImage(UIImage(named: "RightArrowButton"), for: .normal)
        kuznetskyButton.setImage(UIImage(named: "RightArrowButton"), for: .normal)
        depoButton.setImage(UIImage(named: "RightArrowButton"), for: .normal)
    }
    
    
    private func setupNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .alert]) { granted, error in
            if !granted {
                ThreadConstant.UI_THREAD {
                    let alert = UIAlertController(title: nil, message: "Need notification", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
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


// Presentable
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
        ThreadConstant.UI_THREAD {
             let alert = UIAlertController(title: "Что-то пошло не так..",
                                                     message: text,
                                                     preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}


