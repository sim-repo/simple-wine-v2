import Foundation


struct FetchConstant {
    
    static let intervalBeforeUpdating = 60.0*30 //in min
    static var intervalBkgMode: TimeInterval = 1
    
    enum UserDefaultsEnum: String {
        case lastSyncDate
    }
}
