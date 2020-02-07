import Foundation
import RealmSwift

class RealmProduct: RealmBase {
    @objc dynamic var name: String = ""
    @objc dynamic var categoryId: Int = 0
    @objc dynamic var pointEnum: String = ""
    @objc dynamic var desc: String = ""
    @objc dynamic var bigDesc: String = ""
    @objc dynamic var price: Double = 0
    @objc dynamic var oldPrice: Double = 0
    @objc dynamic var popularity: Int = 0
    let attributeIds = List<Int>()
    @objc dynamic var imageURL: String = ""
    @objc dynamic var manufactureYear: Int = 0
    @objc dynamic var isLiked = false
}
