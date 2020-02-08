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


extension UIView {
    
    func hideShadow(isHidden: Bool) {
        layer.shadowOpacity = isHidden ? 0.0 : 0.9
    }
    
    func addPieceOfShadow() {
        layer.shadowPath = UIBezierPath(rect: CGRect(x: bounds.origin.x, y: bounds.origin.y + 50, width: 5, height: bounds.height - 50)).cgPath
        layer.shadowRadius = 10.0
        layer.shadowOpacity = 0.9
    }
    
    func applyShadow(shouldApply: Bool = true) {
        if shouldApply {
            layer.shadowPath = UIBezierPath(rect: bounds).cgPath
            layer.shadowRadius = 18.0
            layer.shadowOpacity = 0.4
        } else {
            layer.shadowPath = nil
            layer.shadowRadius = 0.0
            layer.shadowOpacity = 0.0
        }
    }
}
