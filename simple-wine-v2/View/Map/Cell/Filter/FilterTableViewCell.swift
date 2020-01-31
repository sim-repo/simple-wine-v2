
import UIKit

class FilterTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    
    var presenter: ViewableFilterPresenter!
    var indexPath: IndexPath!
    
    func setup(_ filter: Filter, _ presenter: ViewableFilterPresenter, _ indexPath: IndexPath) {
        titleButton.setTitle(filter.title, for: .normal)
        self.presenter = presenter
        self.indexPath = indexPath
        titleButton.showsTouchWhenHighlighted = true
    }
    
    @IBAction func doPressTitle(_ sender: Any) {
        
        UIView.animateKeyframes(withDuration: 0.3, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/2) {
                self.titleButton.backgroundColor = #colorLiteral(red: 0.7988784909, green: 0.8025768399, blue: 0.8116125464, alpha: 1)
            }
            UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1/2) {
                self.titleButton.backgroundColor = .white
            }
        },
        completion: {_ in
            self.presenter.titleDidPress(at: self.indexPath)
        })
    }
    
    @IBAction func doPressFilter(_ sender: Any) {
    }
    
}
