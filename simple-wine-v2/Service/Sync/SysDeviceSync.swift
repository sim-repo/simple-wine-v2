import Foundation
import Reachability
import Alamofire

class SysDeviceSync {
    
    private init(){}
    static var shared = SysDeviceSync()
   
    func sync(_ onSuccess: setterSystemDeviceOnSuccess, _ onError: setterOnError) {
        
        
        let url = "https://simplewine.ru/api/v2/system/device/"

        let params: Parameters = [:]
        
        AlamofireService.requestSystemDevice(url, params, onSuccess, onError)
    }
}
