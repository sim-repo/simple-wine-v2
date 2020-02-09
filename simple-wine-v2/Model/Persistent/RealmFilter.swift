import Foundation
import RealmSwift

class RealmFilter: RealmBase {
    @objc dynamic var title: String = ""
    let parentId = RealmOptional<Int>()
    @objc dynamic var pointEnum: String = ""
    @objc dynamic var kindId: Int = 0
    @objc dynamic var categoryId: Int = 0
    @objc dynamic var level: Int = 0
    @objc dynamic var parentTitle: String = ""
    @objc dynamic var selected = false
    @objc dynamic var isPrice = false
}
