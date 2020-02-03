import Foundation

class Point {
    
    var id: PointEnum
    var name = ""
    var logoOnLightImageURL = ""
    
    init(id: PointEnum, name: String, logoOnLightImageURL: String) {
        self.id = id
        self.name = name
        self.logoOnLightImageURL = logoOnLightImageURL
    }
    
    static func list()->[Point] {
        return [
            Point(id: PointEnum.grandcru, name: "Grand Cru", logoOnLightImageURL: "logo2_grancru_on_light"),
            Point(id: PointEnum.kuznetskiymost, name: "Кузнецкий Мост", logoOnLightImageURL: "logo2_kuznetsky_on_light"),
            Point(id: PointEnum.depo, name: "Депо", logoOnLightImageURL: "logo_depo_on_dark"),
        ]
    }
}
