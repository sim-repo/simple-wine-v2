import Foundation

struct NetworkConstant {
    
    static let basePath = "http://185.219.42.85:3000"
    
    static let timeout: TimeInterval = 10 // in sec
    
    static let maxRetryNumber = 3
    static let waitForNextTrying = 50 // in millisec
    
    static func getFullPath(path: String) -> URL {
        let url = URL(string: basePath + "/" + path)
        return url!
    }
}
