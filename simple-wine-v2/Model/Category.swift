import Foundation


class Category: Codable {
    
    var id = 0
    var title = ""
    var imageURL = ""
    var kinds: [Int] = []
    
    init(id: Int, title: String, imageURL: String){
        self.id = id
        self.title = title
        self.imageURL = imageURL
    }
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageURL
        case kinds
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.imageURL, forKey: .imageURL)
        try container.encode(self.kinds, forKey: .kinds)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        imageURL = try container.decode(String.self, forKey: .imageURL)
        kinds = try container.decode([Int].self, forKey: .kinds)
    }
    
    
    static func list() -> [Category] {
        return [
            Category(id: 0, title: "Вино", imageURL: "logo-wines2"),
            Category(id: 1, title: "Шампанское и Игристое",  imageURL: "shampane-logo"),
            Category(id: 2, title: "Крепкие Напитки",  imageURL: "drink-logo"),
            Category(id: 3, title: "Винные Сеты",  imageURL: "Set-Logo"),
            Category(id: 4, title: "Вода и Соки",  imageURL: "juice"),
        ]
    }
}
