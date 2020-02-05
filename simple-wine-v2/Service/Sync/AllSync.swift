import Foundation
import Alamofire

class AllSync {

    private init(){}
    static var shared = AllSync()
    
    func syncFilter(by pointEnum: PointEnum,
                    _ onSuccess: setterOnSuccess,
                    _ onError: setterOnError) {
        
        
        let urlPath = "http://185.219.42.85:3000/all2"
        
        let params: Parameters = [
            "pointId": pointEnum.rawValue
        ]
        
        AlamofireService.requestAllSync(urlPath, params, onSuccess, onError)
    }
}
