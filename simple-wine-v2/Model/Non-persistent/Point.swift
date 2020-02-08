import Foundation

class Point: Codable, PersistableModel {

    var id: PointEnum = .unknown
    var name = ""
    var logoOnLightImageURL = ""
    
    var pointId = ""
    
    init(id: PointEnum, name: String, logoOnLightImageURL: String) {
        self.id = id
        self.name = name
        self.logoOnLightImageURL = logoOnLightImageURL
        pointId = id.rawValue
    }
    
    
    //MARK:- Codable >> 
    
    required init(from decoder: Decoder) throws {
       let container = try decoder.container(keyedBy: CodingKeys.self)
       pointId = try container.decode(String.self, forKey: .pointId)
       guard let pointEnum = PointEnum.init(rawValue: pointId) else { return }
       id = pointEnum
       
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
    
    
    //MARK:- for testing only
    static func list()->[Point] {
        return [
            Point(id: PointEnum.grandcru, name: "Grand Cru", logoOnLightImageURL: "http://185.219.42.85:3000/Images/logo2_grancru_on_light.png"),
            Point(id: PointEnum.kuznetskiymost, name: "Кузнецкий Мост", logoOnLightImageURL: "http://185.219.42.85:3000/Images/logo2_kuznetsky_on_light3x.png"),
            Point(id: PointEnum.depo, name: "Депо", logoOnLightImageURL: "http://185.219.42.85:3000/Images/logo_depo_on_dark3x.png"),
        ]
    }
}

