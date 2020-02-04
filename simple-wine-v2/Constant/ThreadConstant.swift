import Foundation


func UI_THREAD(_ block: @escaping (() -> Void)) {
    DispatchQueue.main.async(execute: block)
}


private let serialQueue = DispatchQueue(label: "")

func SERIAL_THREAD(_ block: @escaping (() -> Void)) {
    serialQueue.async(execute: block)
}
