import Foundation
import RealmSwift

class RealmProduct: RealmBase {
    @objc dynamic var name: String = ""
    @objc dynamic var nameRU: String = ""
    @objc dynamic var categoryId: Int = 0
    @objc dynamic var pointEnum: String = ""
    @objc dynamic var desc: String = ""
    @objc dynamic var price: Double = 0
    @objc dynamic var volume: String = ""
    let attributeIds = List<Int>()
    @objc dynamic var imageURL: String = ""
    @objc dynamic var manufactureYear: Int = 0
    @objc dynamic var grapes: String = ""
    @objc dynamic var color: String = ""
    @objc dynamic var country: String = ""
    @objc dynamic var countryIconURL: String = ""
    @objc dynamic var sugar: String = ""
}
