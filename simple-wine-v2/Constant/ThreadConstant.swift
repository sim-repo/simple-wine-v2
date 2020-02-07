import Foundation


struct ThreadConstant {
    
    static func UI_THREAD(_ block: @escaping (() -> Void)) {
        DispatchQueue.main.async(execute: block)
    }


    private static let serialQueue = DispatchQueue(label: "")

    static func SERIAL_THREAD(_ block: @escaping (() -> Void)) {
        serialQueue.async(execute: block)
    }
}
