import UIKit


class KuznetskyCover: CoverView {

    @IBOutlet weak var backButton: UIButton!
    
    static func nib() -> CoverView {
        let nib = UINib(nibName: "KuznetskyCover", bundle: nil)
        return nib.instantiate(withOwner: nil, options: nil)[0] as! KuznetskyCover
    }
    
    override func setupOutlets(){
        let image = getSystemImage(name: "arrow.left.circle", pointSize: Theme.buttonSize, color: Theme.buttonCloseColor)
        backButton.setImage(image, for: .normal)
    }
    
    @IBAction func pressEnter(_ sender: Any) {
        delegate?.didPressEnter()
    }
    
    @IBAction func pressBack(_ sender: Any) {
        delegate?.didPressLogout()
    }
    
}
