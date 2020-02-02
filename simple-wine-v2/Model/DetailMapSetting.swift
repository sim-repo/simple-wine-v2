import Foundation


class DetailMapSetting {
    
    var categoryId = 0
    var kindIds: [Int] = []
    var prefix: [String] = []
    var icons: [String?] = []
    
    init(categoryId: Int, kindIds: [Int], prefix: [String], icons: [String?]) {
        self.categoryId = categoryId
        self.kindIds = kindIds
        self.prefix = prefix
        self.icons = icons
    }
    
    static func list() -> [DetailMapSetting] {
        return [
            DetailMapSetting(categoryId: 0, kindIds: [1,4,5,6], prefix: ["Цвет", "Сорт Винограда", "Объем", "Производитель"], icons: [nil,"WineGrapes",nil, nil])
        ]
    }
}
