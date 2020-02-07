import Foundation


var session: URLSession {
    let config = URLSessionConfiguration.default
    config.timeoutIntervalForRequest = 60
    config.timeoutIntervalForResource = 60
    config.allowsExpensiveNetworkAccess = true
    config.allowsCellularAccess = true
    return URLSession(configuration: config)
}
