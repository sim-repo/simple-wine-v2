import Foundation


class Product: Codable, PersistableModel  {
    
    // identifying:
    var id = 0
    var pointEnum: PointEnum = .unknown
    var menuMapEnum: MenuMapEnum = .unknown
    var categoryId = 0
    
    // filter dependencies:
    var attributeIds: [Int] = []
    
    // ordinary:
    var name = ""
    var nameRU = ""
    var volume = ""
    var grapes = ""
    var color: ProductColorEnum = .unknown
    var country = ""
    var countryIconURL = ""
    var desc = ""
    var price: Double = 0
    var imageURL = ""
    var manufactureYear: Int
    var sugar: ProductSugarEnum = .unknown
    var isLiked = false
    
    // enum supporting fields:
    var pointId = ""
    var menuMapId = ""
    
    
    init(id: Int, name: String, pointEnum: PointEnum, menuMapEnum: MenuMapEnum, categoryId: Int, desc: String, price: Double, attributeIds: [Int], imageURL: String, manufactureYear: Int, nameRU: String, volume: String, grapes: String, color: ProductColorEnum, country: String, countryIconURL: String, sugar: ProductSugarEnum){
        self.id = id
        self.name = name
        self.pointEnum = pointEnum
        self.menuMapEnum = menuMapEnum
        self.categoryId = categoryId
        self.desc = desc
        self.price = price
        self.attributeIds = attributeIds
        self.imageURL = imageURL
        self.manufactureYear = manufactureYear
        self.nameRU = nameRU
        self.volume = volume
        self.grapes = grapes
        self.color = color
        self.country = country
        self.countryIconURL = countryIconURL
        self.sugar = sugar
        
        
        pointId = pointEnum.rawValue
        menuMapId = menuMapEnum.rawValue
    }
    
    
    
    //MARK:- Codable >>
    
    enum CodingKeys: String, CodingKey {
        case id
        case pointId
        case menuMapId
        case categoryId
        case name
        case nameRU
        case desc
        case bigDesc
        case price
        case oldPrice
        case volume
        case attributeIds
        case imageURL
        case manufactureYear
        case grapes
        case color
        case country
        case countryIconURL
        case sugar
    }
    
    
    // remove after testing >>
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(pointId, forKey: .pointId)
        try container.encode(menuMapId, forKey: .menuMapId)
        try container.encode(categoryId, forKey: .categoryId)
        
        try container.encode(attributeIds, forKey: .attributeIds)
        
        try container.encode(name, forKey: .name)
        try container.encode(nameRU, forKey: .nameRU)
        try container.encode(desc, forKey: .desc)
        try container.encode(price, forKey: .price)
        try container.encode(volume, forKey: .volume)
        try container.encode(imageURL, forKey: .imageURL)
        try container.encode(manufactureYear, forKey: .manufactureYear)
        try container.encode(grapes, forKey: .grapes)
        try container.encode(color.rawValue, forKey: .color)
        try container.encode(country, forKey: .country)
        try container.encode(countryIconURL, forKey: .countryIconURL)
        try container.encode(sugar.rawValue, forKey: .sugar)
    }
    // remove after testing <<
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        categoryId = try container.decode(Int.self, forKey: .categoryId)
        
        attributeIds = try container.decode([Int].self, forKey: .attributeIds)
        
        name = try container.decode(String.self, forKey: .name)
        nameRU = try container.decode(String.self, forKey: .nameRU)
        desc = try container.decode(String.self, forKey: .desc)
        price = try container.decode(Double.self, forKey: .price)
        volume = try container.decode(String.self, forKey: .volume)
        
        imageURL = try container.decode(String.self, forKey: .imageURL)
        manufactureYear = try container.decode(Int.self, forKey: .manufactureYear)
        grapes = try container.decode(String.self, forKey: .grapes)
        
        
        //enums:
        let pointText = try container.decode(String.self, forKey: .pointId)
        pointEnum = PointEnum.init(rawValue: pointText) ?? .unknown
        
        let menuMapText = try container.decode(String.self, forKey: .menuMapId)
        menuMapEnum = MenuMapEnum.init(rawValue: menuMapText) ?? .unknown
        
        let colorText = try container.decode(String.self, forKey: .color)
        self.color = ProductColorEnum.init(rawValue: colorText) ?? .unknown
    
        country = try container.decode(String.self, forKey: .country)
        countryIconURL = try container.decode(String.self, forKey: .countryIconURL)
        
        let sugarText = try container.decode(String.self, forKey: .sugar)
        sugar = ProductSugarEnum.init(rawValue: sugarText) ?? .unknown
    }
}
