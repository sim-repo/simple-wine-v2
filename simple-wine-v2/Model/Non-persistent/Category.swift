import Foundation


class Category: Codable, PersistableModel {
    
    var id = 0
    var title = ""
    var pointEnum: PointEnum = .unknown
    var pointId = ""
    
    
    init(id: Int, title: String, pointEnum: PointEnum){
        self.id = id
        self.title = title
        self.pointEnum = pointEnum
        pointId = pointEnum.rawValue
    }
    
    
    
    //MARK:- Codable >>
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case pointId
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.pointId, forKey: .pointId)
        try container.encode(self.title, forKey: .title)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        pointId = try container.decode(String.self, forKey: .pointId)
        guard let pointEnum = PointEnum.init(rawValue: pointId) else { return }
        self.pointEnum = pointEnum
    }
    
    
    
    //MARK:- for testing only
    
    static func list() -> [Category] {
        return [
            Category(id: 0, title: "Вино", pointEnum: .grandcru),
            Category(id: 1, title: "Шампанское и Игристое",  pointEnum: .grandcru),
            Category(id: 2, title: "Крепкие Напитки",  pointEnum: .grandcru),
            Category(id: 3, title: "Винные Сеты",  pointEnum: .grandcru),
            Category(id: 4, title: "Вода и Соки",  pointEnum: .grandcru),
        ]
    }
}
