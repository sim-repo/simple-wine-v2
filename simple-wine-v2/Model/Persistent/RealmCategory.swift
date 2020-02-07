import Foundation
import RealmSwift

class RealmCategory: RealmBase {
    @objc dynamic var title: String = ""
    @objc dynamic var imageURL: String = ""
}
