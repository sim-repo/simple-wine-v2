import Foundation


class Filter: Codable, PersistableModel  {
    
    var id = 0
    var title = ""
    var parentId: Int?
    var pointEnum: PointEnum = .unknown
    var menuMapEnum: MenuMapEnum = .unknown
    var kindId = 0
    var categoryId = 0
    var level = 0
    var parentTitle: String?
    var volume: FilterVolumeEnum = .unknown
    
    // enum supporting fields:
    var pointId = ""
    var menuMapId = ""
    
    
    init(id: Int, pointEnum: PointEnum, menuMapEnum: MenuMapEnum, title: String, parentId: Int?, level: Int, parentTitle: String?, kind: Int, categoryId: Int){
        self.id = id
        self.pointEnum = pointEnum
        self.menuMapEnum = menuMapEnum
        self.title = title
        self.parentId = parentId
        self.level = level
        self.parentTitle = parentTitle
        self.kindId = kind
        self.categoryId = categoryId
        pointId = pointEnum.rawValue
        menuMapId = menuMapEnum.rawValue
        validate()
    }
    
    
    private func validate() {
        guard parentId != id
            else {
                //TODO: error
                return
        }
    }
    
    
    //MARK:- Codable >> 
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case parentId
        case pointId
        case menuMapId
        case kindId
        case categoryId
        case level
        case parentTitle
        case volume
    }
    
    
    // remove after testing >>
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.parentId, forKey: .parentId)
        try container.encode(self.pointId, forKey: .pointId)
        try container.encode(self.kindId, forKey: .kindId)
        try container.encode(self.categoryId, forKey: .categoryId)
        try container.encode(self.level, forKey: .level)
        try container.encode(self.parentTitle, forKey: .parentTitle)
        try container.encode(self.menuMapId, forKey: .menuMapId)
        try container.encode(self.volume.rawValue, forKey: .volume)
    }
    // remove after testing <<
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        parentId = try container.decode(Int?.self, forKey: .parentId)
        kindId = try container.decode(Int.self, forKey: .kindId)
        categoryId = try container.decode(Int.self, forKey: .categoryId)
        level = try container.decode(Int.self, forKey: .level)
        let parentTitle = try container.decode(String?.self, forKey: .parentTitle)
        self.parentTitle = parentTitle == nil ? "" : parentTitle
        
        // enums:
        let pointText = try container.decode(String.self, forKey: .pointId)
        pointEnum = PointEnum.init(rawValue: pointText) ?? .unknown
        
        let menuMapText = try container.decode(String.self, forKey: .menuMapId)
        menuMapEnum = MenuMapEnum.init(rawValue: menuMapText) ?? .unknown
        
        let volumeText = try container.decode(String.self, forKey: .volume)
        self.volume = FilterVolumeEnum.init(rawValue: volumeText) ?? .unknown
    }
}
