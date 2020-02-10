import Foundation


class Product: Codable, PersistableModel  {
    
    var id = 0
    var name = ""
    var nameRU = "" // added
    var volume = "" //added
    var grapes = "" //added
    var color: ProductColorEnum = .unknown //added
    var country = ""
    var countryIconURL = "" //added
    var categoryId = 0
    var pointEnum: PointEnum = .unknown
    var desc = ""
    var price: Double = 0
    var attributeIds: [Int] = []
    var imageURL = ""
    var manufactureYear: Int
    var sugar: ProductSugarEnum = .unknown //added

    var isLiked = false
    var pointId = ""
    
    
    init(id: Int, name: String, pointEnum: PointEnum, categoryId: Int, desc: String, price: Double, attributeIds: [Int], imageURL: String, manufactureYear: Int, nameRU: String, volume: String, grapes: String, color: ProductColorEnum, country: String, countryIconURL: String, sugar: ProductSugarEnum){
        self.id = id
        self.name = name
        self.pointEnum = pointEnum
        self.categoryId = categoryId
        self.desc = desc
        self.price = price
        self.attributeIds = attributeIds
        self.imageURL = imageURL
        self.manufactureYear = manufactureYear
        pointId = pointEnum.rawValue
        self.nameRU = nameRU
        self.volume = volume
        self.grapes = grapes
        self.color = color
        self.country = country
        self.countryIconURL = countryIconURL
        self.sugar = sugar
    }
    
    
    
    //MARK:- Codable >>
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case nameRU
        case categoryId
        case pointId
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
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(nameRU, forKey: .nameRU)
        try container.encode(categoryId, forKey: .categoryId)
        try container.encode(pointId, forKey: .pointId)
        try container.encode(desc, forKey: .desc)
        try container.encode(price, forKey: .price)
        try container.encode(volume, forKey: .volume)
        try container.encode(attributeIds, forKey: .attributeIds)
        try container.encode(imageURL, forKey: .imageURL)
        try container.encode(manufactureYear, forKey: .manufactureYear)
        try container.encode(grapes, forKey: .grapes)
        try container.encode(color.rawValue, forKey: .color)
        try container.encode(country, forKey: .country)
        try container.encode(countryIconURL, forKey: .countryIconURL)
        try container.encode(sugar.rawValue, forKey: .sugar)
    }
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        nameRU = try container.decode(String.self, forKey: .nameRU)
        categoryId = try container.decode(Int.self, forKey: .categoryId)
        pointId = try container.decode(String.self, forKey: .pointId)
        desc = try container.decode(String.self, forKey: .desc)
        price = try container.decode(Double.self, forKey: .price)
        volume = try container.decode(String.self, forKey: .volume)
        attributeIds = try container.decode([Int].self, forKey: .attributeIds)
        imageURL = try container.decode(String.self, forKey: .imageURL)
        manufactureYear = try container.decode(Int.self, forKey: .manufactureYear)
        grapes = try container.decode(String.self, forKey: .grapes)
        
        let colorText = try container.decode(String.self, forKey: .color)
        if let colorEnum = ProductColorEnum.init(rawValue: colorText) {
            self.color = colorEnum
        }
        
        country = try container.decode(String.self, forKey: .country)
        countryIconURL = try container.decode(String.self, forKey: .countryIconURL)
        
        guard let pointEnum = PointEnum.init(rawValue: pointId) else { return }
        self.pointEnum = pointEnum
        
        
        let sugarText = try container.decode(String.self, forKey: .sugar)
        if let sugarEnum = ProductSugarEnum.init(rawValue: sugarText) {
           self.sugar = sugarEnum
        }
        
    }
}
