import Foundation


class Category: Codable, PersistableModel {
    
    var id = 0
    var title = ""
    var imageURL = ""
    
    init(id: Int, title: String, imageURL: String){
        self.id = id
        self.title = title
        self.imageURL = imageURL
    }
    
    
    
    //MARK:- Codable >>
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageURL
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.imageURL, forKey: .imageURL)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        imageURL = try container.decode(String.self, forKey: .imageURL)
    }
    
    
    
    //MARK:- for testing only
    
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
