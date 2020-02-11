import Foundation
import Alamofire
import SwiftyJSON


class AlamofireService {

    public static let sharedManager: SessionManager = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        config.timeoutIntervalForRequest = 40
        config.timeoutIntervalForResource = 40
        let manager = Alamofire.SessionManager(configuration: config)
        return manager
    }()
    
    
    public static func requestSystemDevice(_ url: String,
                                           _ params: Parameters,
                                           _ onSuccess: setterSystemDeviceOnSuccess,
                                           _ onError: setterOnError
                                           ) {
        AlamofireService.sharedManager.request(url, method: .get, parameters: params).responseJSON { response in
            switch response.result {
            case .success(let val):
               let deviceId = ParseService.parseSysDevice(val)
               onSuccess?(deviceId)
            case .failure(let err):
                onError?(err.localizedDescription)
            }
        }
    }
    
    
    public static func requestLogin(_ url: String,
                                    _ headers: HTTPHeaders,
                                    _ params: Parameters,
                                    _ onSuccess: setterLoginOnSuccess,
                                    _ onError: setterOnError,
                                    _ syncOnSuccess: syncLoginOnSuccess,
                                    _ userId: String,
                                    _ password: String,
                                    _ deviceId: String ) {
       
        AlamofireService.sharedManager.request(url, method: .post, parameters: params, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let val):
                if let login = ParseService.parseLogin(val, userId: userId, password: password, deviceId: deviceId, onError: onError) {
                    syncOnSuccess?(login)
                    onSuccess?(login)
                }
            case .failure(let err):
                onError?(err.localizedDescription)
            }
        }
    }
    
    
    public static func requestToken(_ url: String,
                                    _ headers: HTTPHeaders,
                                    _ params: Parameters,
                                    _ onSuccess: setterTokenOnSuccess,
                                    _ onError: setterTokenOnError,
                                    _ onAlertError: setterOnError
                                    ) {
       
        AlamofireService.sharedManager.request(url, method: .get, parameters: params, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let val):
                ParseService.parseToken(val, setterTokenOnSuccess: onSuccess, onError, onAlertError)
            case .failure(let err):
                onAlertError?(err.localizedDescription)
            }
        }
    }
}
