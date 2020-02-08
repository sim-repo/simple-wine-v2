import UIKit


class KuznetskyCover: CoverView {

    @IBOutlet weak var backButton: UIButton!
    
    static func nib() -> CoverView {
        let nib = UINib(nibName: "KuznetskyCover", bundle: nil)
        return nib.instantiate(withOwner: nil, options: nil)[0] as! KuznetskyCover
    }
    
    override func setupOutlets(){
        backButton.setImage(UIImage(named: "LeftArrowButton"), for: .normal)
    }
    
    @IBAction func pressEnter(_ sender: Any) {
        delegate?.didPressEnter()
    }
    
    @IBAction func pressBack(_ sender: Any) {
        delegate?.didPressLogout()
    }
    
}
