import UIKit

struct Theme {
    static let waiterBkg: UIColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
    static let bkg: UIColor = #colorLiteral(red: 0.999904573, green: 1, blue: 0.9998722672, alpha: 1)
    static let borderOnBkg: UIColor = #colorLiteral(red: 0.6451660991, green: 0.5660883784, blue: 0.5325201154, alpha: 1)
    static let selectedFilterMenuItem = #colorLiteral(red: 0.6451660991, green: 0.5660883784, blue: 0.5325201154, alpha: 1)
    static let unselected = UIColor.rgba(64, 64, 64)
    static var selected = UIColor.rgba(164, 32, 63)
    
    
    private struct AppCustomFontNames {
        static let geometria = "Geometria"
    }

    static func simpleMedium(ofSize size: CGFloat) -> UIFont {
        if let font = UIFont(name: AppCustomFontNames.geometria, size: size) {
            return font
        } else {
            return UIFont.systemFont(ofSize: size, weight: .regular)
        }
    }
    
    static func charterBold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "CharterITC-Bold", size: size)!
    }
    
    static func charterBoldItalic(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "CharterITC-BoldItalic", size: size)!
    }
    
    static func charterRegular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "CharterITC", size: size)!
    }
    
    static func charterItalic(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "CharterITC-Italic", size: size)!
    }
    
    static func geometriaRegular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Geometria", size: size)!
    }
    
    static func geometriaMedium(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Geometria-Medium", size: size)!
    }
    
    static func geometriaLight(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Geometria-Light", size: size)!
    }
    
    static func simpleSemibold(ofSize size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .semibold)
    }
}

