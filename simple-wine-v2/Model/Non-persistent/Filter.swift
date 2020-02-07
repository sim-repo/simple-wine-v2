import Foundation


class Filter: Codable, PersistableModel  {
    var id = 0
    var title = ""
    var parentId: Int?
    var pointEnum: PointEnum = .unknown
    var kindId = 0
    var categoryId = 0
    
    var level = 0 // calc
    var parentTitle: String? // calc
    var selected = false
    
    var pointId = ""
    
    init(id: Int, pointEnum: PointEnum, title: String, parentId: Int?, level: Int, parentTitle: String?, kind: Int, categoryId: Int){
        self.id = id
        self.pointEnum = pointEnum
        self.title = title
        self.parentId = parentId
        self.level = level
        self.parentTitle = parentTitle
        self.kindId = kind
        self.categoryId = categoryId
        pointId = pointEnum.rawValue
        validate()
    }
    
    
    private func validate() {
        guard parentId != id
            else {
                //TODO: error
                return
        }
    }
    
    
    //MARK:- Codable >> 
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case parentId
        case pointId
        case kindId
        case categoryId
        case level
        case parentTitle
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.parentId, forKey: .parentId)
        try container.encode(self.pointId, forKey: .pointId)
        try container.encode(self.kindId, forKey: .kindId)
        try container.encode(self.categoryId, forKey: .categoryId)
        try container.encode(self.level, forKey: .level)
        try container.encode(self.parentTitle, forKey: .parentTitle)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        parentId = try container.decode(Int?.self, forKey: .parentId)
        pointId = try container.decode(String.self, forKey: .pointId)
        guard let pointEnum = PointEnum.init(rawValue: pointId) else { return }
        self.pointEnum = pointEnum
        kindId = try container.decode(Int.self, forKey: .kindId)
        categoryId = try container.decode(Int.self, forKey: .categoryId)
        level = try container.decode(Int.self, forKey: .level)
        parentTitle = try container.decode(String?.self, forKey: .parentTitle)
    }
    
    
    
    //MARK:- for testing only

    static func list0() -> [Filter] {
        return [
            Filter(id: 0, pointEnum: .grandcru, title: "Цвет", parentId: nil, level: 0, parentTitle: nil, kind: 1, categoryId: 0),
            Filter(id: 1, pointEnum: .grandcru, title: "Страна", parentId: nil, level: 0, parentTitle: nil, kind: 2, categoryId: 0),
            Filter(id: 2, pointEnum: .grandcru, title: "Цена", parentId: nil, level: 0, parentTitle: nil, kind: 3, categoryId: 0),
            Filter(id: 3, pointEnum: .grandcru, title: "Сорт Винограда", parentId: nil, level: 0, parentTitle: nil, kind: 4, categoryId: 0),
            Filter(id: 4, pointEnum: .grandcru, title: "Объем", parentId: nil, level: 0, parentTitle: nil, kind: 5, categoryId: 0),
            Filter(id: 5, pointEnum: .grandcru, title: "Производитель", parentId: nil, level: 0, parentTitle: nil, kind: 6, categoryId: 0),
            
            Filter(id: 6, pointEnum: .grandcru, title: "Красное", parentId: 0, level: 1, parentTitle: "Цвет", kind: 1, categoryId: 0),
            Filter(id: 7, pointEnum: .grandcru, title: "Белое", parentId: 0, level: 1, parentTitle: "Цвет", kind: 1, categoryId: 0),
            Filter(id: 8, pointEnum: .grandcru, title: "Розовое", parentId: 0, level: 1, parentTitle: "Цвет", kind: 1, categoryId: 0),
            
            Filter(id: 9, pointEnum: .grandcru, title: "Испания", parentId: 1, level: 1, parentTitle: "Страна", kind: 2, categoryId: 0),
            Filter(id: 10, pointEnum: .grandcru, title: "Франция", parentId: 1, level: 1, parentTitle: "Страна", kind: 2, categoryId: 0),
            Filter(id: 11, pointEnum: .grandcru, title: "Италия", parentId: 1, level: 1, parentTitle: "Страна", kind: 2, categoryId: 0),
            
            
            Filter(id: 12, pointEnum: .grandcru, title: "Долина Луары", parentId: 10, level: 2, parentTitle: "Франция", kind: 2, categoryId: 0),
            Filter(id: 13, pointEnum: .grandcru, title: "Бургундия", parentId: 10, level: 2, parentTitle: "Франция", kind: 2, categoryId: 0),
            Filter(id: 14, pointEnum: .grandcru, title: "Аквитания", parentId: 10, level: 2, parentTitle: "Франция", kind: 2, categoryId: 0),
            
            
            Filter(id: 15, pointEnum: .grandcru, title: "Пьемонт", parentId: 11, level: 2, parentTitle: "Италия", kind: 2, categoryId: 0),
            Filter(id: 16, pointEnum: .grandcru, title: "Лацио", parentId: 11, level: 2, parentTitle: "Италия", kind: 2, categoryId: 0),
            Filter(id: 17, pointEnum: .grandcru, title: "Абруццо", parentId: 11, level: 2, parentTitle: "Италия", kind: 2, categoryId: 0),
            
            
            Filter(id: 18, pointEnum: .grandcru, title: "Валенсия", parentId: 9, level: 2, parentTitle: "Испания", kind: 2, categoryId: 0),
            Filter(id: 19, pointEnum: .grandcru, title: "Ла Манча", parentId: 9, level: 2, parentTitle: "Испания", kind: 2, categoryId: 0),
            Filter(id: 20, pointEnum: .grandcru, title: "Риоха", parentId: 9, level: 2, parentTitle: "Испания", kind: 2, categoryId: 0),
            
            
            Filter(id: 21, pointEnum: .grandcru, title: "до 1 500 ₽", parentId: 2, level: 1, parentTitle: "Цена", kind: 3, categoryId: 0),
            Filter(id: 22, pointEnum: .grandcru, title: "от 1 500 до 3 000 ₽", parentId: 2, level: 1, parentTitle: "Цена", kind: 3, categoryId: 0),
            Filter(id: 23, pointEnum: .grandcru, title: "от 3 000 до 5 000 ₽", parentId: 2, level: 1, parentTitle: "Цена", kind: 3, categoryId: 0),
            Filter(id: 24, pointEnum: .grandcru, title: "от 10 000 ₽", parentId: 2, level: 1, parentTitle: "Цена", kind: 3, categoryId: 0),
            
            Filter(id: 25, pointEnum: .grandcru, title: "алиберне", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 26, pointEnum: .grandcru, title: "аликанте", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 27, pointEnum: .grandcru, title: "альбариньо", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 28, pointEnum: .grandcru, title: "альянико", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 29, pointEnum: .grandcru, title: "амарал", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 30, pointEnum: .grandcru, title: "ансоника", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 31, pointEnum: .grandcru, title: "аринто", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 32, pointEnum: .grandcru, title: "арнеис", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 33, pointEnum: .grandcru, title: "асал", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 34, pointEnum: .grandcru, title: "барбера", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 35, pointEnum: .grandcru, title: "бастардо магарачский", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 36, pointEnum: .grandcru, title: "белые сорта винограда", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 37, pointEnum: .grandcru, title: "блауфренкиш", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 38, pointEnum: .grandcru, title: "боваледду", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 39, pointEnum: .grandcru, title: "бонарда", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 40, pointEnum: .grandcru, title: "боррасал", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 41, pointEnum: .grandcru, title: "бурбуленк", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 42, pointEnum: .grandcru, title: "бьянколлела", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 43, pointEnum: .grandcru, title: "верделло", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 44, pointEnum: .grandcru, title: "вердехо", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 45, pointEnum: .grandcru, title: "вердиккио", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 46, pointEnum: .grandcru, title: "верментино", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 47, pointEnum: .grandcru, title: "весполина", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 48, pointEnum: .grandcru, title: "виньяо", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 49, pointEnum: .grandcru, title: "виозиньо", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 50, pointEnum: .grandcru, title: "вионье", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 51, pointEnum: .grandcru, title: "витовска", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 52, pointEnum: .grandcru, title: "виура", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 53, pointEnum: .grandcru, title: "гальоппо", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 54, pointEnum: .grandcru, title: "гаме", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 55, pointEnum: .grandcru, title: "гарганега", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 56, pointEnum: .grandcru, title: "гарнача", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 57, pointEnum: .grandcru, title: "гевюрцтраминер", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 58, pointEnum: .grandcru, title: "годельо", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 59, pointEnum: .grandcru, title: "грасиано", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 60, pointEnum: .grandcru, title: "греканико", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 62, pointEnum: .grandcru, title: "греко", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 63, pointEnum: .grandcru, title: "грилло", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 64, pointEnum: .grandcru, title: "джинестра", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 65, pointEnum: .grandcru, title: "зинфандель", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 66, pointEnum: .grandcru, title: "каберло", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 67, pointEnum: .grandcru, title: "каберне совиньон", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 68, pointEnum: .grandcru, title: "каберне фран", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            Filter(id: 69, pointEnum: .grandcru, title: "канайоло", parentId: 3, level: 1, parentTitle: "Сорт Винограда", kind: 4, categoryId: 0),
            
            
            
            Filter(id: 70, pointEnum: .grandcru, title: "3", parentId: 4, level: 1, parentTitle: "Объем", kind: 5, categoryId: 0),
            Filter(id: 71, pointEnum: .grandcru, title: "6", parentId: 4, level: 1, parentTitle: "Объем", kind: 5, categoryId: 0),
            Filter(id: 72, pointEnum: .grandcru, title: "0.187", parentId: 4, level: 1, parentTitle: "Объем", kind: 5, categoryId: 0),
            Filter(id: 73, pointEnum: .grandcru, title: "0.2", parentId: 4, level: 1, parentTitle: "Объем", kind: 5, categoryId: 0),
            Filter(id: 74, pointEnum: .grandcru, title: "0.375", parentId: 4, level: 1, parentTitle: "Объем", kind: 5, categoryId: 0),
            Filter(id: 75, pointEnum: .grandcru, title: "0.5", parentId: 4, level: 1, parentTitle: "Объем", kind: 5, categoryId: 0),
            Filter(id: 76, pointEnum: .grandcru, title: "0.7", parentId: 4, level: 1, parentTitle: "Объем", kind: 5, categoryId: 0),
            Filter(id: 77, pointEnum: .grandcru, title: "0.73", parentId: 4, level: 1, parentTitle: "Объем", kind: 5, categoryId: 0),
            Filter(id: 78, pointEnum: .grandcru, title: "0.75", parentId: 4, level: 1, parentTitle: "Объем", kind: 5, categoryId: 0),
            Filter(id: 79, pointEnum: .grandcru, title: "1.5", parentId: 4, level: 1, parentTitle: "Объем", kind: 5, categoryId: 0),
            
            
            
            Filter(id: 80, pointEnum: .grandcru, title: "Cantine Marisa Cuomo", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6, categoryId: 0),
            Filter(id: 81, pointEnum: .grandcru, title: "Capannelle", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6, categoryId: 0),
            Filter(id: 82, pointEnum: .grandcru, title: "Dino Illuminati", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6, categoryId: 0),
            Filter(id: 83, pointEnum: .grandcru, title: "Adegas Gran Vinum", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6, categoryId: 0),
            Filter(id: 84, pointEnum: .grandcru, title: "Bodegas Alion", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6, categoryId: 0),
            Filter(id: 85, pointEnum: .grandcru, title: "Bodegas Hermanos Sastre", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6, categoryId: 0),
            Filter(id: 86, pointEnum: .grandcru, title: "Bonneau du Martray", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6, categoryId: 0),
            Filter(id: 87, pointEnum: .grandcru, title: "Chateau Brane-Cantenac", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6, categoryId: 0),
            Filter(id: 88, pointEnum: .grandcru, title: "Chateau Fourcas Hosten", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6, categoryId: 0),
            Filter(id: 89, pointEnum: .grandcru, title: "Julien Brocard", parentId: 5, level: 1, parentTitle: "Производитель", kind: 6, categoryId: 0)
            
        ]
    }
    
    
    
    
    static func list1() -> [Filter] {
           return [
               Filter(id: 90, pointEnum: .grandcru, title: "Цвет", parentId: nil, level: 0, parentTitle: nil, kind: 7, categoryId: 1),
               Filter(id: 91, pointEnum: .grandcru, title: "Страна", parentId: nil, level: 0, parentTitle: nil, kind: 8, categoryId: 1),
               Filter(id: 92, pointEnum: .grandcru, title: "Цена", parentId: nil, level: 0, parentTitle: nil, kind: 9, categoryId: 1),
               Filter(id: 93, pointEnum: .grandcru, title: "Сахар", parentId: nil, level: 0, parentTitle: nil, kind: 10, categoryId: 1),
               Filter(id: 94, pointEnum: .grandcru, title: "Объем", parentId: nil, level: 0, parentTitle: nil, kind: 11, categoryId: 1),
               Filter(id: 95, pointEnum: .grandcru, title: "Производитель", parentId: nil, level: 0, parentTitle: nil, kind: 12, categoryId: 1),
               
               Filter(id: 96, pointEnum: .grandcru, title: "Белое", parentId: 90, level: 1, parentTitle: "Цвет", kind: 7, categoryId: 1),
               Filter(id: 97, pointEnum: .grandcru, title: "Розовое", parentId: 90, level: 1, parentTitle: "Цвет", kind: 7, categoryId: 1),
               
               Filter(id: 98, pointEnum: .grandcru, title: "Испания", parentId: 91, level: 1, parentTitle: "Страна", kind: 8, categoryId: 1),
               Filter(id: 99, pointEnum: .grandcru, title: "Италия", parentId: 91, level: 1, parentTitle: "Страна", kind: 8, categoryId: 1),
               Filter(id: 100, pointEnum: .grandcru, title: "Франция", parentId: 91, level: 1, parentTitle: "Страна", kind: 8, categoryId: 1),
               Filter(id: 101, pointEnum: .grandcru, title: "Соединенное Королевство", parentId: 91, level: 1, parentTitle: "Страна", kind: 8, categoryId: 1),
               Filter(id: 102, pointEnum: .grandcru, title: "Россия", parentId: 91, level: 1, parentTitle: "Страна", kind: 8, categoryId: 1),
               
               
               Filter(id: 103, pointEnum: .grandcru, title: "Долина Луары", parentId: 100, level: 2, parentTitle: "Франция", kind: 8, categoryId: 1),
               Filter(id: 104, pointEnum: .grandcru, title: "Бургундия", parentId: 100, level: 2, parentTitle: "Франция", kind: 8, categoryId: 1),
               Filter(id: 105, pointEnum: .grandcru, title: "Аквитания", parentId: 100, level: 2, parentTitle: "Франция", kind: 8, categoryId: 1),
               
               
               Filter(id: 106, pointEnum: .grandcru, title: "Пьемонт", parentId: 99, level: 2, parentTitle: "Италия", kind: 8, categoryId: 1),
               Filter(id: 107, pointEnum: .grandcru, title: "Лацио", parentId: 99, level: 2, parentTitle: "Италия", kind: 8, categoryId: 1),
               Filter(id: 108, pointEnum: .grandcru, title: "Абруццо", parentId: 99, level: 2, parentTitle: "Италия", kind: 8, categoryId: 1),
               
               
               Filter(id: 109, pointEnum: .grandcru, title: "Валенсия", parentId: 98, level: 2, parentTitle: "Испания", kind: 8, categoryId: 1),
               Filter(id: 110, pointEnum: .grandcru, title: "Ла Манча", parentId: 98, level: 2, parentTitle: "Испания", kind: 8, categoryId: 1),
               Filter(id: 111, pointEnum: .grandcru, title: "Риоха", parentId: 98, level: 2, parentTitle: "Испания", kind: 8, categoryId: 1),
               
               
               Filter(id: 112, pointEnum: .grandcru, title: "Уэссекс", parentId: 101, level: 2, parentTitle: "Соединенное Королевство", kind: 8, categoryId: 1),
               Filter(id: 113, pointEnum: .grandcru, title: "Лондон", parentId: 101, level: 2, parentTitle: "Соединенное Королевство", kind: 8, categoryId: 1),
                
               
               Filter(id: 114, pointEnum: .grandcru, title: "Крым", parentId: 102, level: 2, parentTitle: "Россия", kind: 8, categoryId: 1),
               Filter(id: 115, pointEnum: .grandcru, title: "Краснодар", parentId: 102, level: 2, parentTitle: "Россия", kind: 8, categoryId: 1),
               
               
               Filter(id: 116, pointEnum: .grandcru, title: "до 1 500 ₽", parentId: 92, level: 1, parentTitle: "Цена", kind: 9, categoryId: 1),
               Filter(id: 117, pointEnum: .grandcru, title: "от 1 500 до 3 000 ₽", parentId: 92, level: 1, parentTitle: "Цена", kind: 9, categoryId: 1),
               Filter(id: 118, pointEnum: .grandcru, title: "от 3 000 до 5 000 ₽", parentId: 92, level: 1, parentTitle: "Цена", kind: 9, categoryId: 1),
               Filter(id: 119, pointEnum: .grandcru, title: "от 10 000 ₽", parentId: 92, level: 1, parentTitle: "Цена", kind: 9, categoryId: 1),
               
               
               
               Filter(id: 120, pointEnum: .grandcru, title: "полусладкое", parentId: 93, level: 1, parentTitle: "Сахар", kind: 10, categoryId: 1),
               Filter(id: 121, pointEnum: .grandcru, title: "полусухое", parentId: 93, level: 1, parentTitle: "Сахар", kind: 10, categoryId: 1),
               Filter(id: 122, pointEnum: .grandcru, title: "сладкое", parentId: 93, level: 1, parentTitle: "Сахар", kind: 10, categoryId: 1),
               Filter(id: 123, pointEnum: .grandcru, title: "сухое", parentId: 93, level: 1, parentTitle: "Сахар", kind: 10, categoryId: 1),
               
        
               
               Filter(id: 124, pointEnum: .grandcru, title: "3", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 125, pointEnum: .grandcru, title: "6", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 126, pointEnum: .grandcru, title: "0.187", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 127, pointEnum: .grandcru, title: "0.2", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 128, pointEnum: .grandcru, title: "0.375", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 129, pointEnum: .grandcru, title: "0.5", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 130, pointEnum: .grandcru, title: "0.7", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 131, pointEnum: .grandcru, title: "0.73", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 132, pointEnum: .grandcru, title: "0.75", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               Filter(id: 133, pointEnum: .grandcru, title: "1.5", parentId: 94, level: 1, parentTitle: "Объем", kind: 11, categoryId: 1),
               
               
            
               Filter(id: 134, pointEnum: .grandcru, title: "Braida", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1),
               Filter(id: 135, pointEnum: .grandcru, title: "Casa Coste Piane", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1),
               Filter(id: 136, pointEnum: .grandcru, title: "Chanoine", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1),
               Filter(id: 137, pointEnum: .grandcru, title: "Pierre Gimonnet & Fils", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1),
               Filter(id: 138, pointEnum: .grandcru, title: "Geoffroy", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1),
               Filter(id: 139, pointEnum: .grandcru, title: "Lanson", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1),
               Filter(id: 140, pointEnum: .grandcru, title: "Jerome Prevost", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1),
               Filter(id: 141, pointEnum: .grandcru, title: "Domaine Bott-Geyl", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1),
               Filter(id: 142, pointEnum: .grandcru, title: "Les Celliers Jean d'Alibert", parentId: 95, level: 1, parentTitle: "Производитель", kind: 12, categoryId: 1)
           ]
       }
    
}
