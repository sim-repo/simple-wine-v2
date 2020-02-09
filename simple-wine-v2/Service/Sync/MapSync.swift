import Foundation

class MapSync: PresentableMapSync {

    private init(){}
    static var shared = MapSync()
    
    func syncFilter(pointEnum: PointEnum,
                    onSuccess: (([Filter]) -> Void)?,
                    onError: ((String) -> Void)?) {
        
      //  onSuccess?(Filter.list0() + Filter.list1())
    }
}


