import Foundation


struct FetchConfiguration {
    
    static let intervalBeforeUpdating = 60*60.0 //in min
    static var intervalBkgMode: TimeInterval = 1
    
    enum UserDefaultsEnum: String {
        case lastSyncDate
    }
}
