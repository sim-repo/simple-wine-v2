import Foundation


class Login: PersistableModel {

    var userId: String
    var password: String
    var token: String
    var deviceId: String
    
    init(userId: String, password: String, token: String, deviceId: String) {
        self.userId = userId
        self.password = password
        self.token = token
        self.deviceId = deviceId
    }
}
