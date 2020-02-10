import Foundation


class Filter: Codable, PersistableModel  {
    var id = 0
    var title = ""
    var parentId: Int?
    var pointEnum: PointEnum = .unknown
    var kindId = 0
    var categoryId = 0
    var level = 0
    var parentTitle: String?
    var pointId = ""
    var isPrice = false  //# >> проект тупое начальство
    var volume: FilterVolumeEnum = .v_0187
    
    
    init(id: Int, pointEnum: PointEnum, title: String, parentId: Int?, level: Int, parentTitle: String?, kind: Int, categoryId: Int){
        self.id = id
        self.pointEnum = pointEnum
        self.title = title
        self.parentId = parentId
        self.level = level
        self.parentTitle = parentTitle
        self.kindId = kind
        self.categoryId = categoryId
        pointId = pointEnum.rawValue
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
        case kindId
        case categoryId
        case level
        case parentTitle
        case isPrice
        case volume
    }
    
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
        try container.encode(self.isPrice, forKey: .isPrice)
        try container.encode(self.volume.rawValue, forKey: .volume)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        parentId = try container.decode(Int?.self, forKey: .parentId)
        pointId = try container.decode(String.self, forKey: .pointId)
        guard let pointEnum = PointEnum.init(rawValue: pointId) else { return }
        self.pointEnum = pointEnum
        kindId = try container.decode(Int.self, forKey: .kindId)
        categoryId = try container.decode(Int.self, forKey: .categoryId)
        level = try container.decode(Int.self, forKey: .level)
        let parentTitle = try container.decode(String?.self, forKey: .parentTitle)
        self.parentTitle = parentTitle == nil ? "" : parentTitle
        isPrice = try container.decode(Bool.self, forKey: .isPrice)
        let volume = try container.decode(String.self, forKey: .volume)
        if let volumeEnum = FilterVolumeEnum.init(rawValue: volume) {
            self.volume = volumeEnum
        }
    }
}
