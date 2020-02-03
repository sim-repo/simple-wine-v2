import UIKit


class GrandCruCover: CoverView {

    @IBOutlet weak var contentView: UIView!
    
    
    static func nib() -> CoverView {
        let nib = UINib(nibName: "GrandCruCover", bundle: nil)
        return nib.instantiate(withOwner: nil, options: nil)[0] as! GrandCruCover
    }
    
    
    @IBAction func pressEnter(_ sender: Any) {
        delegate?.didPressEnter()
    }
    
    @IBAction func pressLogout(_ sender: Any) {
        delegate?.didPressLogout()
    }
}
