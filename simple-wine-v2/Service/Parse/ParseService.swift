import Foundation
import SwiftyJSON

class ParseService {
    
    static func decodeAll(data: Data, _ onError: setterOnError) -> Response? {
        do {
            let response: Response = try JSONDecoder().decode(Response.self, from: data)
            return response
        } catch DecodingError.dataCorrupted(let context) {
            onError?("ParseService: DecodingError.dataCorrupted: \(DecodingError.dataCorrupted(context))")
        } catch DecodingError.keyNotFound(let key, let context) {
            onError?("ParseService: DecodingError.keyNotFound: \(DecodingError.keyNotFound(key,context))")
        } catch DecodingError.typeMismatch(let type, let context) {
            onError?("ParseService: DecodingError.typeMismatch: \(DecodingError.typeMismatch(type,context))")
        } catch DecodingError.valueNotFound(let value, let context) {
            onError?("ParseService: DecodingError.typeMismatch: \(DecodingError.valueNotFound(value,context))")
        } catch let error {
            onError?("ParseService: \(error.localizedDescription)")
        }
        return nil
    }
    
    
    static func parseSysDevice(_ val: Any) -> String {
        let json = JSON(val)
        let deviceId = json["data"]["device"].stringValue
        return deviceId
    }
    
    
    static func parseLogin(_ val: Any, userId: String, password: String, deviceId: String, onError: setterOnError) -> Login? {
        let json = JSON(val)
        let status = json["status"].stringValue
        if status == "success" {
            let token = json["data"]["token"].stringValue
            return Login(userId: userId, password: password, token: token, deviceId: deviceId)
        }
        onError?(json.string ?? "Ошибка аутентификации: неверный логин или пароль, обратитесь в службу поддержки.")
        return nil
    }
    
    static func parseToken(_ val: Any, setterTokenOnSuccess: setterTokenOnSuccess, _ onError: setterTokenOnError, _ onAlertError: setterOnError) {
        let json = JSON(val)
        let status = json["status"].stringValue
        if status == "success" {
            setterTokenOnSuccess?(true)
            return
        } else {
            if let _ = json["errors"].array {
                onError?()
                return
            }
        }
        onAlertError?("Ошибка провеки токена: сервер вернул нераспознанные данные, обратитесь в службу поддержки.")
    }
}
                                   
