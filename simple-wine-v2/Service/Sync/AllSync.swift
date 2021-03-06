import Foundation
import Reachability

class AllSync {
    
    private init(){}
    static var shared = AllSync()
    let reachability = try! Reachability()
    var closure: (()->Void)?
    var onErr: ((String) -> Void)?

    
    func sync(_ onSuccess: setterOnSuccess,
              _ onError: setterOnError) {
        
        if loadFromRealm(onSuccess,
                         onError) {
            return
        }
        onErr = onError
        closure = getSyncClosure(onSuccess, onError)
        setReachabilityNotifier()
    }
    
    
    
    private func getSyncClosure(_ onSuccess: setterOnSuccess,
                                _ onError: setterOnError) -> (()->Void)? {
        return {[weak self] in
            guard let self = self else { return }
            let url = NetworkConstant.getFullPath(path: "all2")
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            NetworkService.requestAll(request, onSuccess, onError, self.getOnSuccess())
        }
    }
}


//MARK:- Persistence Support

extension AllSync {
    
    // on success
    private func getOnSuccess() -> syncOnSuccess {
       
        let completion: syncOnSuccess = { [weak self] points, categories, filters, products, detailMapSettings in
            guard let self = self else { return }
            RealmService.clearAll(confEnum: .unsafe)
            RealmService.save(models: points, update: true)
            RealmService.save(models: categories, update: true)
            RealmService.save(models: filters, update: true)
            RealmService.save(models: products, update: true)
            RealmService.save(models: detailMapSettings, update: true)
            self.reachability.stopNotifier()
            NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: self.reachability)
            self.closure = nil
        }
        return completion
    }
    
    
    private func loadFromRealm(_ onSuccess: setterOnSuccess,
                               _ onError: setterOnError) -> Bool {
        
        guard let points = RealmService.loadPoints(),
        let categories = RealmService.loadCategories(),
        let filters = RealmService.loadFilters(),
        let products = RealmService.loadProducts(),
        let settings = RealmService.loadDetailMapSettings()
        else {
            return false
        }
        // TODO: add threads
        onSuccess?(points, categories, filters, products, settings)
        return true
    }
}


//MARK:- Reachability Support
extension AllSync {
    
    private func setReachabilityNotifier() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        do{
          try reachability.startNotifier()
        }catch{
          print("could not start reachability notifier")
        }
    }
    
    
    @objc func reachabilityChanged(note: Notification) {

      let reachability = note.object as! Reachability

      switch reachability.connection {
          case .wifi:
              print("Reachable via WiFi")
              closure?()
              
          case .cellular:
              print("Reachable via Cellular")
              closure?()
        
          case .unavailable:
            onErr?("Интернет не доступен!")
           break
        
          default: break
      }
    }
        
}
