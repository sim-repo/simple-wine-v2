import Foundation


protocol DownloadableSetter {
    func downloadUpdateProgress(progress: Float, totalSize : String)
    func downloadDidFinish()
}
