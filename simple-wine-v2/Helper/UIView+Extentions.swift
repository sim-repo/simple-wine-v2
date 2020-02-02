import UIKit


// top menu effect
extension UIView {
    func move(to destination: CGPoint,
              duration: TimeInterval,
              options: UIView.AnimationOptions,
              completion: (()->Void)? = nil)  {
        
        UIView.animate(withDuration: duration, delay: 0, options: options,
        animations: {
            self.center = destination
        }, completion: {_ in
            completion?()
        })
    }
}
