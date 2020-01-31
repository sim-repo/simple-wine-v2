import Foundation


class Filter {
    var id = 0
    var title = ""
    var parentId: Int?
    
    var level = 0 // calc
    
    init(id: Int, title: String, parentId: Int?, level: Int){
        self.id = id
        self.title = title
        self.parentId = parentId
        self.level = level
    }
    
    static func list() -> [Filter] {
        return [
            Filter(id: 5, title: "Цвет", parentId: 0, level: 0),
            Filter(id: 6, title: "Страна", parentId: 0, level: 0),
            Filter(id: 7, title: "Цена", parentId: 0, level: 0),
            Filter(id: 8, title: "Сорт Винограда", parentId: 0, level: 0),
            Filter(id: 9, title: "Объем", parentId: 0, level: 0),
            Filter(id: 10, title: "Производитель", parentId: 0, level: 0)
        ]
    }
    
}
