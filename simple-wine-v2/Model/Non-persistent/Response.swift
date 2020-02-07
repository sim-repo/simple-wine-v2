import Foundation

class Response: Codable {
    
    var points: [Point]
    var categories: [Category]
    var filters: [Filter]
    var products: [Product]
    var detailMapSetting: [DetailMapSetting]
    
    init(points: [Point], categories: [Category], filters: [Filter], products: [Product], detailMapSetting: [DetailMapSetting]) {
        self.points = points
        self.categories = categories
        self.filters = filters
        self.products = products
        self.detailMapSetting = detailMapSetting
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
       // let pointsContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .points)
        self.points = try container.decode([Point].self, forKey: .points)
        self.categories = try container.decode([Category].self, forKey: .categories)
        self.filters = try container.decode([Filter].self, forKey: .filters)
        self.products = try container.decode([Product].self, forKey: .products)
        self.detailMapSetting = try container.decode([DetailMapSetting].self, forKey: .detailMapSetting)
    }
    
    enum CodingKeys: String, CodingKey {
        case points
        case categories
        case filters
        case products
        case detailMapSetting
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(points, forKey: .points)
        try container.encode(categories, forKey: .categories)
        try container.encode(filters, forKey: .filters)
        try container.encode(products, forKey: .products)
        try container.encode(detailMapSetting, forKey: .detailMapSetting)
    }
    
    
    
    static func single() -> Response {
        
        let points = Point.list()
        let categories = Category.list()
        let filters = Filter.list0() + Filter.list1()
        let products = Product.list0() + Product.list1()
        let mapSettings = DetailMapSetting.list()
        let response = Response(points: points, categories: categories, filters: filters, products: products, detailMapSetting: mapSettings)
        return response
    }
}

