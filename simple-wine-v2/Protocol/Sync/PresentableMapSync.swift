import Foundation


protocol PresentableMapSync: class {
    func syncFilter(pointEnum: PointEnum,
                    onSuccess: ((_ filter: [Filter])->Void)?,
                    onError: ((_ error: String) -> Void)?)
}
