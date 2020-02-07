import Foundation
import RealmSwift

class RealmDetailMapSetting: RealmBase {
    @objc dynamic var categoryId: Int = 0
    let kindIds = List<Int>()
    let prefix = List<String>()
    let icons = List<String>()
}
