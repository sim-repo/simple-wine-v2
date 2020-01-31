import Foundation


protocol PresentableMapSync: class {
    func syncFilter(onSuccess: ((_ filter: [Filter])->Void)?,
                    onError: ((_ error: String) -> Void)?)
}
