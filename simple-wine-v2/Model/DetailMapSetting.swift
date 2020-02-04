import Foundation


class DetailMapSetting: Codable {
    
    var categoryId = 0
    var kindIds: [Int] = []
    var prefix: [String] = []
    var icons: [String?] = []
    
    init(categoryId: Int, kindIds: [Int], prefix: [String], icons: [String?]) {
        self.categoryId = categoryId
        self.kindIds = kindIds
        self.prefix = prefix
        self.icons = icons
    }
    
    
    
    required init(from decoder: Decoder) throws {
       let container = try decoder.container(keyedBy: CodingKeys.self)
       categoryId = try container.decode(Int.self, forKey: .categoryId)
       kindIds = try container.decode([Int].self, forKey: .kindIds)
       prefix = try container.decode([String].self, forKey: .prefix)
       icons = try container.decode([String?].self, forKey: .icons)
     }
    
    
    enum CodingKeys: String, CodingKey {
        case categoryId
        case kindIds
        case prefix
        case icons
    }

    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.categoryId, forKey: .categoryId)
        try container.encode(self.kindIds, forKey: .kindIds)
        try container.encode(self.prefix, forKey: .prefix)
        try container.encode(self.icons, forKey: .icons)
    }
    
    
    static func list() -> [DetailMapSetting] {
        return [
            DetailMapSetting(categoryId: 0, kindIds: [1,4,5,6], prefix: ["Цвет", "Сорт Винограда", "Объем", "Производитель"], icons: [nil,"WineGrapes",nil, nil]),
            
            DetailMapSetting(categoryId: 1, kindIds: [7,10,11,12], prefix: ["Цвет", "Сахар", "Объем", "Производитель"], icons: [nil,"WineGrapes",nil, nil]),
        ]
    }
}
