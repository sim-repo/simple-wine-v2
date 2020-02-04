import Foundation
import Alamofire

class PointsSync {

    private init(){}
    static var shared = PointsSync()
    
    func sync(_ onSuccess: setterOnSuccess_Points,
              _ onError: setterOnError) {
        
        
        let urlPath = "http://185.219.42.85:3000/points"
        
        let params: Parameters = [:]
        
        AlamofireService.requestPointsSync(urlPath, params, onSuccess, onError)
    }
}
