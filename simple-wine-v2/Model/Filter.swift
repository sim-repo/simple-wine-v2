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
        validate()
    }
    
    
    private func validate() {
        guard parentId != id
        else {
            //TODO: error
            return
        }
    }
    
    static func list() -> [Filter] {
        return [
            Filter(id: 0, title: "Цвет", parentId: nil, level: 0),
            Filter(id: 1, title: "Страна", parentId: nil, level: 0),
            Filter(id: 2, title: "Цена", parentId: nil, level: 0),
            Filter(id: 3, title: "Сорт Винограда", parentId: nil, level: 0),
            Filter(id: 4, title: "Объем", parentId: nil, level: 0),
            Filter(id: 5, title: "Производитель", parentId: nil, level: 0),
            
            Filter(id: 6, title: "Красное", parentId: 0, level: 1),
            Filter(id: 7, title: "Белое", parentId: 0, level: 1),
            Filter(id: 8, title: "Розовое", parentId: 0, level: 1),
            
            Filter(id: 9, title: "Россия", parentId: 1, level: 2),
            Filter(id: 10, title: "Франция", parentId: 1, level: 2),
            Filter(id: 11, title: "Италия", parentId: 1, level: 2),
            
            
            Filter(id: 12, title: "Долина Луары", parentId: 10, level: 3),
            Filter(id: 13, title: "Бургундия", parentId: 10, level: 3),
            Filter(id: 14, title: "Аквитания", parentId: 10, level: 3),
            
            
            Filter(id: 12, title: "Пьемонт", parentId: 11, level: 3),
            Filter(id: 13, title: "Лацио", parentId: 11, level: 3),
            Filter(id: 14, title: "Абруццо", parentId: 11, level: 3)
        ]
    }
    
}
