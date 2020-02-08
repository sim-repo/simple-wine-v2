import UIKit


//func getSystemImage(name: String, pointSize: CGFloat, color: UIColor) -> UIImage?{
//    
//    if #available(iOS 13.0, *) {
//        let config = UIImage.SymbolConfiguration(pointSize: pointSize, weight: .light, scale: .large)
//        return UIImage(systemName: name, withConfiguration: config)?.withTintColor(color, renderingMode: .alwaysOriginal)
//    } else {
//        return nil
//    }
//}


func renderImage(imageView: UIImageView, color: UIColor) {
    if let image = imageView.image {
        let tintableImage = image.withRenderingMode(.alwaysTemplate)
        imageView.image = tintableImage
        imageView.tintColor = color
    }
}
