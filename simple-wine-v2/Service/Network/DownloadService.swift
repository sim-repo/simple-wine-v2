import Foundation


class DownloadService: NSObject {
    
    static var shared = DownloadService()
    
    var activeDownloads: [URL: Download] = [ : ]
    
    let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    lazy var downloadsSession: URLSession = {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }()
    

    func localFilePath(for url: URL) -> URL {
        return documentsPath.appendingPathComponent(url.lastPathComponent)
    }
}


extension DownloadService {
    
    
    public  func downloadAll( _ request: URLRequest,
                              _ onSuccess: setterOnSuccess,
                              _ onError: setterOnError,
                              _ syncOnSuccess: syncOnSuccess) {
        
        
        let download = Download(onSuccess: onSuccess, onError: onError, syncOnSuccess: syncOnSuccess)
        activeDownloads[request.url!] = download
        downloadsSession.downloadTask(with: request).resume()
    }
}


extension DownloadService: URLSessionDelegate {
    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        (Setter.shared as DownloadableSetter).downloadDidFinish()
    }
}


// Presentable
extension DownloadService: URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        // 1
        guard let sourceURL = downloadTask.originalRequest?.url else {
            return
        }
        let destinationURL = localFilePath(for: sourceURL)
        
        // 3
        let fileManager = FileManager.default
        try? fileManager.removeItem(at: destinationURL)
        
        do {
            try fileManager.copyItem(at: location, to: destinationURL)
        } catch let error {
            print("Could not copy file to disk: \(error.localizedDescription)")
        }
        
        guard let download = activeDownloads[sourceURL] else { return }
        
        if let string = try? String(contentsOf: destinationURL) {
            guard let data = string.data(using: .utf8) else { return }
            guard let resp = ParseService.decodeAll(data: data, download.onError) else { return }
            (Setter.shared as DownloadableSetter).downloadDidFinish()
            download.onSuccess?(resp.points)
            download.syncOnSuccess?(resp.points, resp.categories, resp.filters, resp.products, resp.detailMapSetting)
        }
    }
    
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        let totalSize = ByteCountFormatter.string(fromByteCount: totalBytesExpectedToWrite, countStyle: .file)
        
        (Setter.shared as DownloadableSetter).downloadUpdateProgress(progress: progress, totalSize: totalSize)
    }
}

