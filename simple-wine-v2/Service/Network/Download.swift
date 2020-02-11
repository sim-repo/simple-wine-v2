import Foundation


class Download {

  var isDownloading = false
  var progress: Float = 0
  var resumeData: Data?
  var task: URLSessionDownloadTask?
  var onSuccess: setterOnSuccess
  var onError: setterOnError
  var syncOnSuccess: syncOnSuccess
    
  init(onSuccess: setterOnSuccess, onError: setterOnError, syncOnSuccess: syncOnSuccess) {
    self.onSuccess = onSuccess
    self.onError = onError
    self.syncOnSuccess = syncOnSuccess
  }
}
