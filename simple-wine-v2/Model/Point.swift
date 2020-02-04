import Foundation

class Point: Codable{

    var id: PointEnum = .unknown
    var name = ""
    var logoOnLightImageURL = ""
    
    var pointId = "" {
        willSet {
            if let pointEnum = PointEnum.init(rawValue: newValue) {
                id = pointEnum
            }
        }
    }
    
    init(id: PointEnum, name: String, logoOnLightImageURL: String) {
        self.id = id
        self.name = name
        self.logoOnLightImageURL = logoOnLightImageURL
        pointId = id.rawValue
    }
    
    required init(from decoder: Decoder) throws {
       let container = try decoder.container(keyedBy: CodingKeys.self)
       pointId = try container.decode(String.self, forKey: .pointId)
       name = try container.decode(String.self, forKey: .name)
       logoOnLightImageURL = try container.decode(String.self, forKey: .logoOnLightImageURL)
     }
    
    
    enum CodingKeys: String, CodingKey {
        case pointId
        case name
        case logoOnLightImageURL
    }

    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.pointId, forKey: .pointId)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.logoOnLightImageURL, forKey: .logoOnLightImageURL)
    }
    
    static func list()->[Point] {
        return [
            Point(id: PointEnum.grandcru, name: "Grand Cru", logoOnLightImageURL: "logo2_grancru_on_light"),
            Point(id: PointEnum.kuznetskiymost, name: "Кузнецкий Мост", logoOnLightImageURL: "logo2_kuznetsky_on_light"),
            Point(id: PointEnum.depo, name: "Депо", logoOnLightImageURL: "logo_depo_on_dark"),
        ]
    }
}
