import Foundation


protocol SchedulableSync {
    func getLastSyncDate() -> Date?
    func setLastSyncDate(date: Date)
}
