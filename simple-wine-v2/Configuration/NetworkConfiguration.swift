import Foundation

struct NetworkConfiguration {
    
//MARK:- http:
    
    static let httpBasePath = "http://185.219.42.85:3000"
    
    static let timeout: TimeInterval = 10 // in sec
    
    static let maxRetryNumber = 3
    static let waitForNextTrying = 50 // in millisec
    
    
    static func getFullPath(path: String) -> URL {
        let url = URL(string: httpBasePath + "/" + path)
        return url!
    }
    
//MARK:- websocket:
    static let wsBasePath = "ws://185.219.42.85:1337"
    static let intervalBetweenRetryConnect: TimeInterval = 60 // in sec
    
}
