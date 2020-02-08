import UIKit


class GrandCruCover: CoverView {

    @IBOutlet weak var backButton: UIButton!
    
    static func nib() -> CoverView {
        let nib = UINib(nibName: "GrandCruCover", bundle: nil)
        return nib.instantiate(withOwner: nil, options: nil)[0] as! GrandCruCover
    }
    
    
    override func setupOutlets(){
        backButton.setImage(UIImage(named: "LeftArrowButton"), for: .normal)
    }
    
    @IBAction func pressEnter(_ sender: Any) {
        delegate?.didPressEnter()
    }
    
    @IBAction func pressLogout(_ sender: Any) {
        delegate?.didPressLogout()
    }
}
