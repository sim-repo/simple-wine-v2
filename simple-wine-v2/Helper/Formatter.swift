import UIKit


class Formatter {

    static func priceFormat(price: NSNumber, localeIdentifier: String) -> String? {
        let formatter = NumberFormatter()
        formatter.usesSignificantDigits = false
        formatter.maximumSignificantDigits = 0
        formatter.numberStyle = .currency
        formatter.locale = NSLocale(localeIdentifier: localeIdentifier) as Locale
        let formatPrice = formatter.string(from: price)
        return formatPrice
    }
}
