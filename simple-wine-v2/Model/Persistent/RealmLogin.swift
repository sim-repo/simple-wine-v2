import Foundation
import RealmSwift

class RealmLogin: RealmBase {
    @objc dynamic var userId: String = ""
    @objc dynamic var password: String = ""
    @objc dynamic var token: String = ""
    @objc dynamic var deviceId: String = ""
}
