import Foundation


//MARK:- Setter

//all
typealias setterOnSuccess =  (([Point]) -> Void)?
typealias setterOnError =  ((String) -> Void)?


//system device
typealias setterSystemDeviceOnSuccess =  ((String) -> Void)?

//login
typealias setterLoginOnSuccess =  ((Login) -> Void)?



//MARK:- Sync

//all
typealias syncOnSuccess =  (([Point],[Category],[Filter],[Product],[DetailMapSetting]) -> Void)?
typealias syncLoginOnSuccess =  ((Login) -> Void)?
