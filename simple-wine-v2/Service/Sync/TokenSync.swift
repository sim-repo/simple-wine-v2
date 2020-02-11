import Foundation
import Reachability
import Alamofire

class TokenSync {
    
    private init(){}
    static var shared = TokenSync()
   
    func sync(deviceId: String, tokenId: String, _ onSuccess: setterTokenOnSuccess, _ onError: setterTokenOnError, _ onAlertError: setterOnError ) {
        
        
        let url = "https://simplewine.ru/api/v2/products/?show_filter=N"
        
        
        let headers: HTTPHeaders = [
                   "Accept":"application/json",
                   "X-User-Hash": tokenId,
                   "X-Device-Code": deviceId
               ]

        let params: Parameters = [:]
        
        AlamofireService.requestToken(url,
                                      headers,
                                      params,
                                      onSuccess,
                                      onError,
                                      onAlertError
                                      )
    }
}
