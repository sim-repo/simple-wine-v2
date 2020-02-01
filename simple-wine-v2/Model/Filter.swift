import Foundation


class Filter {
    var id = 0
    var title = ""
    var parentId: Int?
    var kind = 0
    
    var level = 0 // calc
    var parentTitle: String? // calc
    var selected = false
    
    
    init(id: Int, title: String, parentId: Int?, level: Int, parentTitle: String?, kind: Int){
        self.id = id
        self.title = title
        self.parentId = parentId
        self.level = level
        self.parentTitle = parentTitle
        self.kind = kind
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
            Filter(id: 0, title: "Цвет", parentId: nil, level: 0, parentTitle: nil, kind: 1),
            Filter(id: 1, title: "Страна", parentId: nil, level: 0, parentTitle: nil, kind: 2),
            Filter(id: 2, title: "Цена", parentId: nil, level: 0, parentTitle: nil, kind: 3),
            Filter(id: 3, title: "Сорт Винограда", parentId: nil, level: 0, parentTitle: nil, kind: 4),
            Filter(id: 4, title: "Объем", parentId: nil, level: 0, parentTitle: nil, kind: 5),
            Filter(id: 5, title: "Производитель", parentId: nil, level: 0, parentTitle: nil, kind: 6),
            
            Filter(id: 6, title: "Красное", parentId: 0, level: 1, parentTitle: "Цвет", kind: 1),
            Filter(id: 7, title: "Белое", parentId: 0, level: 1, parentTitle: "Цвет", kind: 1),
            Filter(id: 8, title: "Розовое", parentId: 0, level: 1, parentTitle: "Цвет", kind: 1),
            
            Filter(id: 9, title: "Испания", parentId: 1, level: 1, parentTitle: "Страна", kind: 2),
            Filter(id: 10, title: "Франция", parentId: 1, level: 1, parentTitle: "Страна", kind: 2),
            Filter(id: 11, title: "Италия", parentId: 1, level: 1, parentTitle: "Страна", kind: 2),
            
            
            Filter(id: 12, title: "Долина Луары", parentId: 10, level: 2, parentTitle: "Франция", kind: 2),
            Filter(id: 13, title: "Бургундия", parentId: 10, level: 2, parentTitle: "Франция", kind: 2),
            Filter(id: 14, title: "Аквитания", parentId: 10, level: 2, parentTitle: "Франция", kind: 2),
            
            
            Filter(id: 15, title: "Пьемонт", parentId: 11, level: 2, parentTitle: "Италия", kind: 2),
            Filter(id: 16, title: "Лацио", parentId: 11, level: 2, parentTitle: "Италия", kind: 2),
            Filter(id: 17, title: "Абруццо", parentId: 11, level: 2, parentTitle: "Италия", kind: 2),
            
            
            Filter(id: 18, title: "Валенсия", parentId: 9, level: 2, parentTitle: "Испания", kind: 2),
            Filter(id: 19, title: "Ла Манча", parentId: 9, level: 2, parentTitle: "Испания", kind: 2),
            Filter(id: 20, title: "Риоха", parentId: 9, level: 2, parentTitle: "Испания", kind: 2),
            
            
            Filter(id: 21, title: "до 1 500 ₽", parentId: 2, level: 1, parentTitle: "Цена", kind: 3),
            Filter(id: 22, title: "от 1 500 до 3 000 ₽", parentId: 2, level: 1, parentTitle: "Цена", kind: 3),
            Filter(id: 23, title: "от 3 000 до 5 000 ₽", parentId: 2, level: 1, parentTitle: "Цена", kind: 3),
            Filter(id: 24, title: "от 10 000 ₽", parentId: 2, level: 1, parentTitle: "Цена", kind: 3),
            
            Filter(id: 25, title: "алиберне", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 26, title: "аликанте", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 27, title: "альбариньо", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 28, title: "альянико", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 29, title: "амарал", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 30, title: "ансоника", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 31, title: "аринто", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 32, title: "арнеис", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 33, title: "асал", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 34, title: "барбера", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 35, title: "бастардо магарачский", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 36, title: "белые сорта винограда", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 37, title: "блауфренкиш", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 38, title: "боваледду", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 39, title: "бонарда", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 40, title: "боррасал", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 41, title: "бурбуленк", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 42, title: "бьянколлела", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 43, title: "верделло", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 44, title: "вердехо", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 45, title: "вердиккио", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 46, title: "верментино", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 47, title: "весполина", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 48, title: "виньяо", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 49, title: "виозиньо", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 50, title: "вионье", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 51, title: "витовска", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 52, title: "виура", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 53, title: "гальоппо", parentId: 2, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 54, title: "гаме", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 55, title: "гарганега", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 56, title: "гарнача", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 57, title: "гевюрцтраминер", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 58, title: "годельо", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 59, title: "грасиано", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 60, title: "греканико", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 62, title: "греко", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 63, title: "грилло", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 64, title: "джинестра", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 65, title: "зинфандель", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 66, title: "каберло", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 67, title: "каберне совиньон", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 68, title: "каберне фран", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            Filter(id: 69, title: "канайоло", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4),
            
            
            
            Filter(id: 70, title: "3", parentId: 4, level: 1, parentTitle: "Объем", kind: 5),
            Filter(id: 71, title: "6", parentId: 4, level: 1, parentTitle: "Объем", kind: 5),
            Filter(id: 72, title: "0.187", parentId: 4, level: 1, parentTitle: "Объем", kind: 5),
            Filter(id: 73, title: "0.2", parentId: 4, level: 1, parentTitle: "Объем", kind: 5),
            Filter(id: 74, title: "0.375", parentId: 4, level: 1, parentTitle: "Объем", kind: 5),
            Filter(id: 75, title: "0.5", parentId: 4, level: 1, parentTitle: "Объем", kind: 5),
            Filter(id: 76, title: "0.7", parentId: 4, level: 1, parentTitle: "Объем", kind: 5),
            Filter(id: 77, title: "0.73", parentId: 4, level: 1, parentTitle: "Объем", kind: 5),
            Filter(id: 78, title: "0.75", parentId: 4, level: 1, parentTitle: "Объем", kind: 5),
            Filter(id: 79, title: "1.5", parentId: 4, level: 1, parentTitle: "Объем", kind: 5),
            
            
            
            Filter(id: 80, title: "Cantine Marisa Cuomo", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6),
            Filter(id: 81, title: "Capannelle", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6),
            Filter(id: 82, title: "Dino Illuminati", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6),
            Filter(id: 83, title: "Adegas Gran Vinum", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6),
            Filter(id: 84, title: "Bodegas Alion", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6),
            Filter(id: 85, title: "Bodegas Hermanos Sastre", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6),
            Filter(id: 86, title: "Bonneau du Martray", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6),
            Filter(id: 87, title: "Chateau Brane-Cantenac", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6),
            Filter(id: 88, title: "Chateau Fourcas Hosten", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6),
            Filter(id: 89, title: "Julien Brocard", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6)
            
        ]
    }
    
}
