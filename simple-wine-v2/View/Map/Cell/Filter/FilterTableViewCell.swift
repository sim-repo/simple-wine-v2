
import UIKit

class FilterTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
  
    var presenter: ViewableFilterPresenter!
    var indexPath: IndexPath!
    var didSelect = false
    
    func setup(_ filter: Filter, _ presenter: ViewableFilterPresenter, _ indexPath: IndexPath) {
        titleButton.setTitle(filter.title, for: .normal)
        self.presenter = presenter
        self.indexPath = indexPath
        titleButton.showsTouchWhenHighlighted = true
        
        didSelect = filter.selected
        setupFilterButton(filter.level == 0)
    }
    
    
    private func setupFilterButton(_ isHidden: Bool? = false) {
        if let hidden = isHidden {
             filterButton.isHidden = hidden
        }
       
        filterButton.setImage(UIImage(systemName: didSelect ? "square.fill" : "square"), for: .normal)
    }
    
    @IBAction func doPressTitle(_ sender: Any) {
        
        UIView.animateKeyframes(withDuration: 0.2, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/2) {
                self.contentView.backgroundColor = #colorLiteral(red: 0.7920138836, green: 0.7865242958, blue: 0.7486471534, alpha: 1)
            }
            UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1/2) {
                self.contentView.backgroundColor = #colorLiteral(red: 0.8830244541, green: 0.8787537813, blue: 0.8263712525, alpha: 1)
            }
        },
        completion: {_ in
            self.presenter.titleDidPress(at: self.indexPath)
        })
    }
    
    
    @IBAction func doPressFilter(_ sender: Any) {
        presenter.filterDidPress(at: indexPath)
        didSelect = !didSelect
        setupFilterButton()
    }
    
}
