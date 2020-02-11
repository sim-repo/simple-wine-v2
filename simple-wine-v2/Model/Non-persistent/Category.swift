import Foundation


class Category: Codable, PersistableModel {
    
    var id = 0
    var title = ""
    var pointEnum: PointEnum = .unknown
    var menuMapEnum: MenuMapEnum = .unknown
    
    // enum supporting fields:
    var pointId = ""
    var menuMapId = ""
    
    
    
    init(id: Int, title: String, pointEnum: PointEnum, menuMapEnum: MenuMapEnum){
        self.id = id
        self.title = title
        self.pointEnum = pointEnum
        self.menuMapEnum = menuMapEnum
        
        menuMapId = menuMapEnum.rawValue
        pointId = pointEnum.rawValue
    }
    
    
    
    //MARK:- Codable >>
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case pointId
        case menuMapId
    }
    
    
    // remove after testing >>
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.pointId, forKey: .pointId)
        try container.encode(self.menuMapId, forKey: .menuMapId)
        try container.encode(self.title, forKey: .title)
    }
    // remove after testing <<
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        
        //enums
        let pointText = try container.decode(String.self, forKey: .pointId)
        pointEnum = PointEnum.init(rawValue: pointText) ?? .unknown
       
        let menuMapText = try container.decode(String.self, forKey: .menuMapId)
        menuMapEnum = MenuMapEnum.init(rawValue: menuMapText) ?? .unknown
    }

}
