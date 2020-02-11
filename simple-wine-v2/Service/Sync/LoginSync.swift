import Foundation
import Reachability
import Alamofire

class LoginSync {
    
    private init(){}
    static var shared = LoginSync()
   
    func sync(deviceId: String, userId: String, password: String, _ onSuccess: setterLoginOnSuccess, _ onError: setterOnError) {
        
        
        let url = "https://simplewine.ru/api/v2/user/authorization/"


        let params: Parameters = [
                  "login": userId,
                  "password": password,
                  "remember": 0
              ]
        
        let headers: HTTPHeaders = [
                   "Accept":"application/json",
                   "Content-Type": "application/x-www-form-urlencoded",
                   "X-Device-Code": deviceId
               ]

        
        AlamofireService.requestLogin(url,
                                      headers,
                                      params,
                                      onSuccess,
                                      onError,
                                      getOnSuccess(),
                                      userId,
                                      password,
                                      deviceId)
    }
    
    
    private func getOnSuccess() -> syncLoginOnSuccess {
          let completion: syncLoginOnSuccess = { login in
              RealmService.save(models: [login], update: false)
          }
          return completion
      }
}
