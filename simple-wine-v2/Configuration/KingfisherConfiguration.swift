import Foundation
import Kingfisher


class KingfisherConfiguration {
     
    private init(){}
    static var shared = KingfisherConfiguration()
    
    func setup(){
        let cache = KingfisherManager.shared.cache
        
        //disk:
        cache.diskStorage.config.sizeLimit = 1000 * 1024 * 1024
        cache.diskStorage.config.expiration = .days(7)
        
        //memory:
        cache.memoryStorage.config.expiration = .seconds(4 * 60 * 60) //4 hours
        cache.memoryStorage.config.totalCostLimit = 1 * 1024 * 1024
    }

    func clearCache(){
        let cache = KingfisherManager.shared.cache
        cache.clearMemoryCache()
        cache.clearDiskCache()
    }
}
