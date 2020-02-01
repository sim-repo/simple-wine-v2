import Foundation


class Filter {
    var id = 0
    var title = ""
    var parentId: Int?
    var kindId = 0
    var categoryId = 0
    
    var level = 0 // calc
    var parentTitle: String? // calc
    var selected = false
    
    
    init(id: Int, title: String, parentId: Int?, level: Int, parentTitle: String?, kind: Int, categoryId: Int){
        self.id = id
        self.title = title
        self.parentId = parentId
        self.level = level
        self.parentTitle = parentTitle
        self.kindId = kind
        self.categoryId = categoryId
        validate()
    }
    
    
    private func validate() {
        guard parentId != id
            else {
                //TODO: error
                return
        }
    }
    
    static func list0() -> [Filter] {
        return [
            Filter(id: 0, title: "Цвет", parentId: nil, level: 0, parentTitle: nil, kind: 1, categoryId: 0),
            Filter(id: 1, title: "Страна", parentId: nil, level: 0, parentTitle: nil, kind: 2, categoryId: 0),
            Filter(id: 2, title: "Цена", parentId: nil, level: 0, parentTitle: nil, kind: 3, categoryId: 0),
            Filter(id: 3, title: "Сорт Винограда", parentId: nil, level: 0, parentTitle: nil, kind: 4, categoryId: 0),
            Filter(id: 4, title: "Объем", parentId: nil, level: 0, parentTitle: nil, kind: 5, categoryId: 0),
            Filter(id: 5, title: "Производитель", parentId: nil, level: 0, parentTitle: nil, kind: 6, categoryId: 0),
            
            Filter(id: 6, title: "Красное", parentId: 0, level: 1, parentTitle: "Цвет", kind: 1, categoryId: 0),
            Filter(id: 7, title: "Белое", parentId: 0, level: 1, parentTitle: "Цвет", kind: 1, categoryId: 0),
            Filter(id: 8, title: "Розовое", parentId: 0, level: 1, parentTitle: "Цвет", kind: 1, categoryId: 0),
            
            Filter(id: 9, title: "Испания", parentId: 1, level: 1, parentTitle: "Страна", kind: 2, categoryId: 0),
            Filter(id: 10, title: "Франция", parentId: 1, level: 1, parentTitle: "Страна", kind: 2, categoryId: 0),
            Filter(id: 11, title: "Италия", parentId: 1, level: 1, parentTitle: "Страна", kind: 2, categoryId: 0),
            
            
            Filter(id: 12, title: "Долина Луары", parentId: 10, level: 2, parentTitle: "Франция", kind: 2, categoryId: 0),
            Filter(id: 13, title: "Бургундия", parentId: 10, level: 2, parentTitle: "Франция", kind: 2, categoryId: 0),
            Filter(id: 14, title: "Аквитания", parentId: 10, level: 2, parentTitle: "Франция", kind: 2, categoryId: 0),
            
            
            Filter(id: 15, title: "Пьемонт", parentId: 11, level: 2, parentTitle: "Италия", kind: 2, categoryId: 0),
            Filter(id: 16, title: "Лацио", parentId: 11, level: 2, parentTitle: "Италия", kind: 2, categoryId: 0),
            Filter(id: 17, title: "Абруццо", parentId: 11, level: 2, parentTitle: "Италия", kind: 2, categoryId: 0),
            
            
            Filter(id: 18, title: "Валенсия", parentId: 9, level: 2, parentTitle: "Испания", kind: 2, categoryId: 0),
            Filter(id: 19, title: "Ла Манча", parentId: 9, level: 2, parentTitle: "Испания", kind: 2, categoryId: 0),
            Filter(id: 20, title: "Риоха", parentId: 9, level: 2, parentTitle: "Испания", kind: 2, categoryId: 0),
            
            
            Filter(id: 21, title: "до 1 500 ₽", parentId: 2, level: 1, parentTitle: "Цена", kind: 3, categoryId: 0),
            Filter(id: 22, title: "от 1 500 до 3 000 ₽", parentId: 2, level: 1, parentTitle: "Цена", kind: 3, categoryId: 0),
            Filter(id: 23, title: "от 3 000 до 5 000 ₽", parentId: 2, level: 1, parentTitle: "Цена", kind: 3, categoryId: 0),
            Filter(id: 24, title: "от 10 000 ₽", parentId: 2, level: 1, parentTitle: "Цена", kind: 3, categoryId: 0),
            
            Filter(id: 25, title: "алиберне", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 26, title: "аликанте", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 27, title: "альбариньо", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 28, title: "альянико", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 29, title: "амарал", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 30, title: "ансоника", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 31, title: "аринто", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 32, title: "арнеис", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 33, title: "асал", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 34, title: "барбера", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 35, title: "бастардо магарачский", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 36, title: "белые сорта винограда", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 37, title: "блауфренкиш", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 38, title: "боваледду", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 39, title: "бонарда", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 40, title: "боррасал", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 41, title: "бурбуленк", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 42, title: "бьянколлела", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 43, title: "верделло", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 44, title: "вердехо", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 45, title: "вердиккио", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 46, title: "верментино", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 47, title: "весполина", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 48, title: "виньяо", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 49, title: "виозиньо", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 50, title: "вионье", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 51, title: "витовска", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 52, title: "виура", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 53, title: "гальоппо", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 54, title: "гаме", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 55, title: "гарганега", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 56, title: "гарнача", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 57, title: "гевюрцтраминер", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 58, title: "годельо", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 59, title: "грасиано", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 60, title: "греканико", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 62, title: "греко", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 63, title: "грилло", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 64, title: "джинестра", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 65, title: "зинфандель", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 66, title: "каберло", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 67, title: "каберне совиньон", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 68, title: "каберне фран", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 69, title: "канайоло", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            
            
            
            Filter(id: 70, title: "3", parentId: 4, level: 1, parentTitle: "Объем", kind: 5, categoryId: 0),
            Filter(id: 71, title: "6", parentId: 4, level: 1, parentTitle: "Объем", kind: 5, categoryId: 0),
            Filter(id: 72, title: "0.187", parentId: 4, level: 1, parentTitle: "Объем", kind: 5, categoryId: 0),
            Filter(id: 73, title: "0.2", parentId: 4, level: 1, parentTitle: "Объем", kind: 5, categoryId: 0),
            Filter(id: 74, title: "0.375", parentId: 4, level: 1, parentTitle: "Объем", kind: 5, categoryId: 0),
            Filter(id: 75, title: "0.5", parentId: 4, level: 1, parentTitle: "Объем", kind: 5, categoryId: 0),
            Filter(id: 76, title: "0.7", parentId: 4, level: 1, parentTitle: "Объем", kind: 5, categoryId: 0),
            Filter(id: 77, title: "0.73", parentId: 4, level: 1, parentTitle: "Объем", kind: 5, categoryId: 0),
            Filter(id: 78, title: "0.75", parentId: 4, level: 1, parentTitle: "Объем", kind: 5, categoryId: 0),
            Filter(id: 79, title: "1.5", parentId: 4, level: 1, parentTitle: "Объем", kind: 5, categoryId: 0),
            
            
            
            Filter(id: 80, title: "Cantine Marisa Cuomo", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6, categoryId: 0),
            Filter(id: 81, title: "Capannelle", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6, categoryId: 0),
            Filter(id: 82, title: "Dino Illuminati", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6, categoryId: 0),
            Filter(id: 83, title: "Adegas Gran Vinum", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6, categoryId: 0),
            Filter(id: 84, title: "Bodegas Alion", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6, categoryId: 0),
            Filter(id: 85, title: "Bodegas Hermanos Sastre", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6, categoryId: 0),
            Filter(id: 86, title: "Bonneau du Martray", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6, categoryId: 0),
            Filter(id: 87, title: "Chateau Brane-Cantenac", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6, categoryId: 0),
            Filter(id: 88, title: "Chateau Fourcas Hosten", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6, categoryId: 0),
            Filter(id: 89, title: "Julien Brocard", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6, categoryId: 0)
            
        ]
    }
    
    
    
    
    static func list1() -> [Filter] {
           return [
               Filter(id: 90, title: "Цвет", parentId: nil, level: 0, parentTitle: nil, kind: 7, categoryId: 1),
               Filter(id: 91, title: "Страна", parentId: nil, level: 0, parentTitle: nil, kind: 8, categoryId: 1),
               Filter(id: 92, title: "Цена", parentId: nil, level: 0, parentTitle: nil, kind: 9, categoryId: 1),
               Filter(id: 93, title: "Сахар", parentId: nil, level: 0, parentTitle: nil, kind: 10, categoryId: 1),
               Filter(id: 94, title: "Объем", parentId: nil, level: 0, parentTitle: nil, kind: 11, categoryId: 1),
               Filter(id: 95, title: "Производитель", parentId: nil, level: 0, parentTitle: nil, kind: 12, categoryId: 1),
               
               Filter(id: 96, title: "Белое", parentId: 90, level: 1, parentTitle: "Цвет", kind: 7, categoryId: 1),
               Filter(id: 97, title: "Розовое", parentId: 90, level: 1, parentTitle: "Цвет", kind: 7, categoryId: 1),
               
               Filter(id: 98, title: "Испания", parentId: 91, level: 1, parentTitle: "Страна", kind: 8, categoryId: 1),
               Filter(id: 99, title: "Италия", parentId: 91, level: 1, parentTitle: "Страна", kind: 8, categoryId: 1),
               Filter(id: 100, title: "Франция", parentId: 91, level: 1, parentTitle: "Страна", kind: 8, categoryId: 1),
               Filter(id: 101, title: "Соединенное Королевство", parentId: 91, level: 1, parentTitle: "Страна", kind: 8, categoryId: 1),
               Filter(id: 102, title: "Россия", parentId: 91, level: 1, parentTitle: "Страна", kind: 8, categoryId: 1),
               
               
               Filter(id: 103, title: "Долина Луары", parentId: 100, level: 2, parentTitle: "Франция", kind: 8, categoryId: 1),
               Filter(id: 104, title: "Бургундия", parentId: 100, level: 2, parentTitle: "Франция", kind: 8, categoryId: 1),
               Filter(id: 105, title: "Аквитания", parentId: 100, level: 2, parentTitle: "Франция", kind: 8, categoryId: 1),
               
               
               Filter(id: 106, title: "Пьемонт", parentId: 99, level: 2, parentTitle: "Италия", kind: 8, categoryId: 1),
               Filter(id: 107, title: "Лацио", parentId: 99, level: 2, parentTitle: "Италия", kind: 8, categoryId: 1),
               Filter(id: 108, title: "Абруццо", parentId: 99, level: 2, parentTitle: "Италия", kind: 8, categoryId: 1),
               
               
               Filter(id: 109, title: "Валенсия", parentId: 98, level: 2, parentTitle: "Испания", kind: 8, categoryId: 1),
               Filter(id: 110, title: "Ла Манча", parentId: 98, level: 2, parentTitle: "Испания", kind: 8, categoryId: 1),
               Filter(id: 111, title: "Риоха", parentId: 98, level: 2, parentTitle: "Испания", kind: 8, categoryId: 1),
               
               
               Filter(id: 112, title: "Уэссекс", parentId: 101, level: 2, parentTitle: "Соединенное Королевство", kind: 8, categoryId: 1),
               Filter(id: 113, title: "Лондон", parentId: 101, level: 2, parentTitle: "Соединенное Королевство", kind: 8, categoryId: 1),
                
               
               Filter(id: 114, title: "Крым", parentId: 102, level: 2, parentTitle: "Россия", kind: 8, categoryId: 1),
               Filter(id: 115, title: "Краснодар", parentId: 102, level: 2, parentTitle: "Россия", kind: 8, categoryId: 1),
               
               
               Filter(id: 116, title: "до 1 500 ₽", parentId: 92, level: 1, parentTitle: "Цена", kind: 9, categoryId: 1),
               Filter(id: 117, title: "от 1 500 до 3 000 ₽", parentId: 92, level: 1, parentTitle: "Цена", kind: 9, categoryId: 1),
               Filter(id: 118, title: "от 3 000 до 5 000 ₽", parentId: 92, level: 1, parentTitle: "Цена", kind: 9, categoryId: 1),
               Filter(id: 119, title: "от 10 000 ₽", parentId: 92, level: 1, parentTitle: "Цена", kind: 9, categoryId: 1),
               
               
               
               Filter(id: 120, title: "полусладкое", parentId: 93, level: 1, parentTitle: "Сахар", kind: 10, categoryId: 1),
               Filter(id: 121, title: "полусухое", parentId: 93, level: 1, parentTitle: "Сахар", kind: 10, categoryId: 1),
               Filter(id: 122, title: "сладкое", parentId: 93, level: 1, parentTitle: "Сахар", kind: 10, categoryId: 1),
               Filter(id: 123, title: "сухое", parentId: 93, level: 1, parentTitle: "Сахар", kind: 10, categoryId: 1),
               
        
               
               Filter(id: 124, title: "3", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 125, title: "6", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 126, title: "0.187", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 127, title: "0.2", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 128, title: "0.375", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 129, title: "0.5", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 130, title: "0.7", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 131, title: "0.73", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 132, title: "0.75", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 133, title: "1.5", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               
               
            
               Filter(id: 134, title: "Braida", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1),
               Filter(id: 135, title: "Casa Coste Piane", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1),
               Filter(id: 136, title: "Chanoine", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1),
               Filter(id: 137, title: "Pierre Gimonnet & Fils", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1),
               Filter(id: 138, title: "Geoffroy", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1),
               Filter(id: 139, title: "Lanson", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1),
               Filter(id: 140, title: "Jerome Prevost", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1),
               Filter(id: 141, title: "Domaine Bott-Geyl", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1),
               Filter(id: 142, title: "Les Celliers Jean d'Alibert", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1)
           ]
       }
    
}
