import UIKit

protocol DropDownProtocol {
    func dropDownPressed(string : String)
}

class DropDownButton: UIButton, DropDownProtocol {
    
    var dropView = DropDownView()
    var height = NSLayoutConstraint()
    var isOpen = false
    var presenter: SortablePresenter!
    var title = ""
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        dropView = DropDownView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        dropView.translatesAutoresizingMaskIntoConstraints = false
        dropView.delegate = self
        title = SortEnum.ourCase.rawValue
    }
    
    func setupPresenter(sortablePresenter: SortablePresenter) {
        presenter = sortablePresenter
        dropView.setupPresenter(sortablePresenter: presenter)
    }
    
    override func didMoveToSuperview() {
        guard let superview = superview else { return }
        superview.addSubview(dropView)
        superview.bringSubviewToFront(dropView)
        
        dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen == false {
            isOpen = true
            NSLayoutConstraint.deactivate([self.height])
            if self.dropView.tableView.contentSize.height > 260 {
                self.dropView.tableView.reloadData()
                self.height.constant = 260
                setOpenedTitle()
            } else {
                setOpenedTitle()
                self.height.constant = self.dropView.tableView.contentSize.height
            }
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {
                self.dropView.layoutIfNeeded()
                self.dropView.center.y += self.dropView.frame.height / 2
            }, completion: nil)
            
        } else {
            isOpen = false
            setClosedTitle()
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {
                self.dropView.center.y -= self.dropView.frame.height / 2
                self.dropView.layoutIfNeeded()
            }, completion: nil)
            
        }
    }
    
    private func setOpenedTitle(){
        self.setTitle(title + " ▲", for: .normal)
    }
    
    private func setClosedTitle(){
        self.setTitle(title + " ▼", for: .normal)
    }
    
    func dropDownPressed(string: String) {
        title = string
        setClosedTitle()
        self.dismissDropDown()
    }
    
    func dismissDropDown() {
        isOpen = false
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([self.height])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.dropView.center.y -= self.dropView.frame.height / 2
            self.dropView.layoutIfNeeded()
        }, completion: nil)
    }
}

