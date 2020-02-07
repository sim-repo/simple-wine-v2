import Foundation
import RealmSwift

class RealmToken: RealmBase {
    @objc dynamic var token: String = ""
    @objc dynamic var userId: String = ""
}
