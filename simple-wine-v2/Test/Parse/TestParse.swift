import Foundation
import Starscream

class TestParse {
    
    private init(){}
    static var shared = TestParse()
    
    var socket = WebSocket(url: URL(string: NetworkConfiguration.wsBasePath + "/")!, protocols: ["chat"])
    
    
    func wsConnect() {
        socket.delegate = self
        socket.connect()
    }
    
    func encode(){
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            if let data = try? encoder.encode(TestParse.single()) {
                print(String(data: data, encoding: .utf8)!)
            }
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    
    func encode(response: Response){
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            if let data = try? encoder.encode(response) {
                print(String(data: data, encoding: .utf8)!)
            }
        } catch let err {
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
            if let messageData = jsonDict["data"] as? String {
                let d: Data? = messageData.data(using: .utf8)
                decode(data: d!)
            }
        }
    }
    
    
    
    static func single() -> Response? {
        
//        let points = Point.list()
//        let categories = Category.list()
//        let filters = TestParse.list0() + TestParse.list1()
//        let products = Product.list0() + Product.list1()
//        let mapSettings = DetailMapSetting.list()
//        let response = Response(points: points, categories: categories, filters: filters, products: products, detailMapSetting: mapSettings)
//        return response
        return nil
    }
    
    
    // Игристое
    static func list0() -> [Filter] {
        return [
            Filter(id: 0, pointEnum: .grandcru, title: "Белое", parentId: nil, level: 0, parentTitle: nil, kind: 1, categoryId: 0),
            Filter(id: 1, pointEnum: .grandcru, title: "Розовое", parentId: nil, level: 0, parentTitle: nil, kind: 2, categoryId: 0),
            Filter(id: 2, pointEnum: .grandcru, title: "Десертное", parentId: nil, level: 0, parentTitle: nil, kind: 3, categoryId: 0),
            Filter(id: 3, pointEnum: .grandcru, title: "Magnum", parentId: nil, level: 0, parentTitle: nil, kind: 4, categoryId: 0),
        ]
    }
    
    
    
    static func list1() -> [Filter] {
           return [
               Filter(id: 90, pointEnum: .grandcru, title: "Цвет", parentId: nil, level: 0, parentTitle: nil, kind: 7, categoryId: 1),
               Filter(id: 91, pointEnum: .grandcru, title: "Страна", parentId: nil, level: 0, parentTitle: nil, kind: 8, categoryId: 1),
               Filter(id: 92, pointEnum: .grandcru, title: "Цена", parentId: nil, level: 0, parentTitle: nil, kind: 9, categoryId: 1),
               Filter(id: 93, pointEnum: .grandcru, title: "Сахар", parentId: nil, level: 0, parentTitle: nil, kind: 10, categoryId: 1),
               Filter(id: 94, pointEnum: .grandcru, title: "Объем", parentId: nil, level: 0, parentTitle: nil, kind: 11, categoryId: 1),
               Filter(id: 95, pointEnum: .grandcru, title: "Производитель", parentId: nil, level: 0, parentTitle: nil, kind: 12, categoryId: 1),
               
               Filter(id: 96, pointEnum: .grandcru, title: "Белое", parentId: 90, level: 1, parentTitle: "Цвет", kind: 7, categoryId: 1),
               Filter(id: 97, pointEnum: .grandcru, title: "Розовое", parentId: 90, level: 1, parentTitle: "Цвет", kind: 7, categoryId: 1),
               
               Filter(id: 98, pointEnum: .grandcru, title: "Испания", parentId: 91, level: 1, parentTitle: "Страна", kind: 8, categoryId: 1),
               Filter(id: 99, pointEnum: .grandcru, title: "Италия", parentId: 91, level: 1, parentTitle: "Страна", kind: 8, categoryId: 1),
               Filter(id: 100, pointEnum: .grandcru, title: "Франция", parentId: 91, level: 1, parentTitle: "Страна", kind: 8, categoryId: 1),
               Filter(id: 101, pointEnum: .grandcru, title: "Соединенное Королевство", parentId: 91, level: 1, parentTitle: "Страна", kind: 8, categoryId: 1),
               Filter(id: 102, pointEnum: .grandcru, title: "Россия", parentId: 91, level: 1, parentTitle: "Страна", kind: 8, categoryId: 1),
               
               
               Filter(id: 103, pointEnum: .grandcru, title: "Долина Луары", parentId: 100, level: 2, parentTitle: "Франция", kind: 8, categoryId: 1),
               Filter(id: 104, pointEnum: .grandcru, title: "Бургундия", parentId: 100, level: 2, parentTitle: "Франция", kind: 8, categoryId: 1),
               Filter(id: 105, pointEnum: .grandcru, title: "Аквитания", parentId: 100, level: 2, parentTitle: "Франция", kind: 8, categoryId: 1),
               
               
               Filter(id: 106, pointEnum: .grandcru, title: "Пьемонт", parentId: 99, level: 2, parentTitle: "Италия", kind: 8, categoryId: 1),
               Filter(id: 107, pointEnum: .grandcru, title: "Лацио", parentId: 99, level: 2, parentTitle: "Италия", kind: 8, categoryId: 1),
               Filter(id: 108, pointEnum: .grandcru, title: "Абруццо", parentId: 99, level: 2, parentTitle: "Италия", kind: 8, categoryId: 1),
               
               
               Filter(id: 109, pointEnum: .grandcru, title: "Валенсия", parentId: 98, level: 2, parentTitle: "Испания", kind: 8, categoryId: 1),
               Filter(id: 110, pointEnum: .grandcru, title: "Ла Манча", parentId: 98, level: 2, parentTitle: "Испания", kind: 8, categoryId: 1),
               Filter(id: 111, pointEnum: .grandcru, title: "Риоха", parentId: 98, level: 2, parentTitle: "Испания", kind: 8, categoryId: 1),
               
               
               Filter(id: 112, pointEnum: .grandcru, title: "Уэссекс", parentId: 101, level: 2, parentTitle: "Соединенное Королевство", kind: 8, categoryId: 1),
               Filter(id: 113, pointEnum: .grandcru, title: "Лондон", parentId: 101, level: 2, parentTitle: "Соединенное Королевство", kind: 8, categoryId: 1),
                
               
               Filter(id: 114, pointEnum: .grandcru, title: "Крым", parentId: 102, level: 2, parentTitle: "Россия", kind: 8, categoryId: 1),
               Filter(id: 115, pointEnum: .grandcru, title: "Краснодар", parentId: 102, level: 2, parentTitle: "Россия", kind: 8, categoryId: 1),
               
               
               Filter(id: 116, pointEnum: .grandcru, title: "до 1 500 ₽", parentId: 92, level: 1, parentTitle: "Цена", kind: 9, categoryId: 1),
               Filter(id: 117, pointEnum: .grandcru, title: "от 1 500 до 3 000 ₽", parentId: 92, level: 1, parentTitle: "Цена", kind: 9, categoryId: 1),
               Filter(id: 118, pointEnum: .grandcru, title: "от 3 000 до 5 000 ₽", parentId: 92, level: 1, parentTitle: "Цена", kind: 9, categoryId: 1),
               Filter(id: 119, pointEnum: .grandcru, title: "от 10 000 ₽", parentId: 92, level: 1, parentTitle: "Цена", kind: 9, categoryId: 1),
               
               
               
               Filter(id: 120, pointEnum: .grandcru, title: "полусладкое", parentId: 93, level: 1, parentTitle: "Сахар", kind: 10, categoryId: 1),
               Filter(id: 121, pointEnum: .grandcru, title: "полусухое", parentId: 93, level: 1, parentTitle: "Сахар", kind: 10, categoryId: 1),
               Filter(id: 122, pointEnum: .grandcru, title: "сладкое", parentId: 93, level: 1, parentTitle: "Сахар", kind: 10, categoryId: 1),
               Filter(id: 123, pointEnum: .grandcru, title: "сухое", parentId: 93, level: 1, parentTitle: "Сахар", kind: 10, categoryId: 1),
               
        
               
               Filter(id: 124, pointEnum: .grandcru, title: "3", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 125, pointEnum: .grandcru, title: "6", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 126, pointEnum: .grandcru, title: "0.187", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 127, pointEnum: .grandcru, title: "0.2", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 128, pointEnum: .grandcru, title: "0.375", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 129, pointEnum: .grandcru, title: "0.5", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 130, pointEnum: .grandcru, title: "0.7", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 131, pointEnum: .grandcru, title: "0.73", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 132, pointEnum: .grandcru, title: "0.75", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 133, pointEnum: .grandcru, title: "1.5", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               
               
            
               Filter(id: 134, pointEnum: .grandcru, title: "Braida", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1),
               Filter(id: 135, pointEnum: .grandcru, title: "Casa Coste Piane", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1),
               Filter(id: 136, pointEnum: .grandcru, title: "Chanoine", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1),
               Filter(id: 137, pointEnum: .grandcru, title: "Pierre Gimonnet & Fils", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1),
               Filter(id: 138, pointEnum: .grandcru, title: "Geoffroy", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1),
               Filter(id: 139, pointEnum: .grandcru, title: "Lanson", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1),
               Filter(id: 140, pointEnum: .grandcru, title: "Jerome Prevost", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1),
               Filter(id: 141, pointEnum: .grandcru, title: "Domaine Bott-Geyl", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1),
               Filter(id: 142, pointEnum: .grandcru, title: "Les Celliers Jean d'Alibert", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1)
           ]
       }
    
}
