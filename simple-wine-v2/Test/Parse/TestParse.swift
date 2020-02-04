import Foundation
import Starscream

class TestParse {
    
    private init(){}
    static var shared = TestParse()
    
    var socket = WebSocket(url: URL(string: "ws://185.219.42.85:1337/")!, protocols: ["chat"])
    
    func wsConnect() {
        socket.delegate = self
        socket.connect()
    }
    
    func encode(){
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            if let data = try? encoder.encode(Response.single()) {
                print(String(data: data, encoding: .utf8)!)
            }
        } catch (let err) {
            print(err.localizedDescription)
        }
    }
    
    
    func decode(data: Data) {
        do {
            
            let response: Response = try JSONDecoder().decode(Response.self, from: data)
            for point in response.points {
                print(point.name)
            }
            print("---------------------------------------------------------")
            for category in response.categories {
                print(category.title)
            }
            print("---------------------------------------------------------")
            for filter in response.filters {
                print(filter.title)
            }
            print("---------------------------------------------------------")
            for product in response.products{
                print(product.name)
            }
            print("---------------------------------------------------------")
            for setting in response.detailMapSetting{
                print(setting.categoryId)
            }
        } catch DecodingError.dataCorrupted(let context) {
            print(DecodingError.dataCorrupted(context))
        } catch DecodingError.keyNotFound(let key, let context) {
            print(DecodingError.keyNotFound(key,context))
        } catch DecodingError.typeMismatch(let type, let context) {
            print(DecodingError.typeMismatch(type,context))
        } catch DecodingError.valueNotFound(let value, let context) {
            print(DecodingError.valueNotFound(value,context))
        } catch let error{
            print(error)
        }
    }
    
    func decode(){
        guard let path = Bundle.main.path(forResource: "Test", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let response: Response = try JSONDecoder().decode(Response.self, from: data)
            for point in response.points {
                print(point.name)
            }
            print("---------------------------------------------------------")
            for category in response.categories {
                print(category.title)
            }
            print("---------------------------------------------------------")
            for filter in response.filters {
                print(filter.title)
            }
            print("---------------------------------------------------------")
            for product in response.products{
                print(product.name)
            }
            print("---------------------------------------------------------")
            for setting in response.detailMapSetting{
                print(setting.categoryId)
            }
        } catch DecodingError.dataCorrupted(let context) {
            print(DecodingError.dataCorrupted(context))
        } catch DecodingError.keyNotFound(let key, let context) {
            print(DecodingError.keyNotFound(key,context))
        } catch DecodingError.typeMismatch(let type, let context) {
            print(DecodingError.typeMismatch(type,context))
        } catch DecodingError.valueNotFound(let value, let context) {
            print(DecodingError.valueNotFound(value,context))
        } catch let error{
            print(error)
        }
    }
    
}


extension TestParse: WebSocketDelegate {
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        
    }
    
    
    func websocketDidConnect(socket: WebSocketClient) {
        socket.write(string: "SIMPLE")
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("SOCKET DISCONNECTED")
        print("SOCKET DISCONNECTED")
        print("SOCKET DISCONNECTED")
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        // 1
        guard let data = text.data(using: .utf16),
            let jsonData = try? JSONSerialization.jsonObject(with: data),
            let jsonDict = jsonData as? [String: Any],
            let messageType = jsonDict["type"] as? String else {
                return
        }
        
        // 2
        if messageType == "message",
            let messageData = jsonDict["data"] as? [String: Any],
            let messageAuthor = messageData["author"] as? String,
            let messageText = messageData["text"] as? String {
            
            print("MESSAGE RECEIVED: \(messageText)")
        }
        
        
        // 2
        if messageType == "bigdata" {
            print("BIG DATA")
            if let messageData = jsonDict["data"] as? String {
                let d: Data? = messageData.data(using: .utf8) // non-nil
                decode(data: d!)
                // wsLoadCategories(messageData)
            }
        }
    }
}
