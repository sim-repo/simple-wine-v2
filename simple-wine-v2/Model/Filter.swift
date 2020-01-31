import Foundation


class Filter {
    var id = 0
    var title = ""
    var parentId: Int?
    
    var level = 0 // calc
    var parentTitle: String? // calc
    var selected = false
    
    
    init(id: Int, title: String, parentId: Int?, level: Int, parentTitle: String?){
        self.id = id
        self.title = title
        self.parentId = parentId
        self.level = level
        self.parentTitle = parentTitle
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
            Filter(id: 0, title: "Цвет", parentId: nil, level: 0, parentTitle: nil),
            Filter(id: 1, title: "Страна", parentId: nil, level: 0, parentTitle: nil),
            Filter(id: 2, title: "Цена", parentId: nil, level: 0, parentTitle: nil),
            Filter(id: 3, title: "Сорт Винограда", parentId: nil, level: 0, parentTitle: nil),
            Filter(id: 4, title: "Объем", parentId: nil, level: 0, parentTitle: nil),
            Filter(id: 5, title: "Производитель", parentId: nil, level: 0, parentTitle: nil),
            
            Filter(id: 6, title: "Красное", parentId: 0, level: 1, parentTitle: "Цвет"),
            Filter(id: 7, title: "Белое", parentId: 0, level: 1, parentTitle: "Цвет"),
            Filter(id: 8, title: "Розовое", parentId: 0, level: 1, parentTitle: "Цвет"),
            
            Filter(id: 9, title: "Испания", parentId: 1, level: 1, parentTitle: "Страна"),
            Filter(id: 10, title: "Франция", parentId: 1, level: 1, parentTitle: "Страна"),
            Filter(id: 11, title: "Италия", parentId: 1, level: 1, parentTitle: "Страна"),
            
            
            Filter(id: 12, title: "Долина Луары", parentId: 10, level: 2, parentTitle: "Франция"),
            Filter(id: 13, title: "Бургундия", parentId: 10, level: 2, parentTitle: "Франция"),
            Filter(id: 14, title: "Аквитания", parentId: 10, level: 2, parentTitle: "Франция"),
            
            
            Filter(id: 15, title: "Пьемонт", parentId: 11, level: 2, parentTitle: "Италия"),
            Filter(id: 16, title: "Лацио", parentId: 11, level: 2, parentTitle: "Италия"),
            Filter(id: 17, title: "Абруццо", parentId: 11, level: 2, parentTitle: "Италия"),
            
            
            Filter(id: 18, title: "Валенсия", parentId: 9, level: 2, parentTitle: "Испания"),
            Filter(id: 19, title: "Ла Манча", parentId: 9, level: 2, parentTitle: "Испания"),
            Filter(id: 20, title: "Риоха", parentId: 9, level: 2, parentTitle: "Испания")
        ]
    }
    
}
