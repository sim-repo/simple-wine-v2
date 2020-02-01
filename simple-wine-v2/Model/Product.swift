import Foundation


class Product {
   
    
    var id = 0
    var name = ""
    var desc = ""
    var price: Double = 0
    var oldPrice: Double = 0
    var popularity = 0
    var filterIds: [Int] = []
    var imageURL = ""
    
    init(id: Int, name: String, desc: String, price: Double, oldPrice: Double, filterIds: [Int], imageURL: String, popularity: Int){
        self.id = id
        self.name = name
        self.desc = desc
        self.price = price
        self.oldPrice = oldPrice
        self.filterIds = filterIds
        self.imageURL = imageURL
        self.popularity = popularity
    }

    
    static func list0() -> [Product] {
        return [
            Product(id: 0, name: "Красное Французское Вино", desc: "Регион: Бургундия \n999 ₽ \nСорт: бьянколлела \nОбъем: 0.375 \nПроизводитель: Chateau Brane-Cantenac", price: 999, oldPrice: 12.0, filterIds: [6,10,13,21,42,74,87], imageURL: "redwine1", popularity: 100),
            Product(id: 1, name: "Белое Итальянское Вино", desc: "Регион: Пьемонт \n1700 ₽ \nСорт: вердиккио\nОбъем: 0.73 \nПроизводитель: Cantine Marisa Cuomo", price: 1700, oldPrice: 14.0, filterIds: [7,11,15,22,45,77,80], imageURL: "white1", popularity: 40),
            Product(id: 2, name: "Розовое Испанское Вино", desc: "Регион: Валенсия \n60 000 ₽ \nСорт: гальоппо\nОбъем: 0.73 \nПроизводитель: ", price: 60000, oldPrice: 15.0, filterIds: [8,9,18,24,53,77], imageURL: "pink", popularity: 75),
            Product(id: 3, name: "Красное Французское Вино 2", desc: "Регион: Бургундия \n4500 ₽ \nСорт: барбера\nОбъем: 0.5 \nПроизводитель: Chateau Fourcas Hosten", price: 4500, oldPrice: 16.0, filterIds:  [6,10,13,23,34,75,88], imageURL: "red2", popularity: 80),
            Product(id: 4, name: "Белое Итальянское Вино", desc: "Регион: Лацио \n650 ₽ \nСорт: бонарда\nОбъем: 0.7 \nПроизводитель: Capannelle", price: 650, oldPrice: 17.0, filterIds: [7,11,16,21,39,76,81], imageURL: "wine4", popularity: 30),
            Product(id: 5, name: "Красное Итальянское Вино", desc: "Регион: Лацио \n2900 ₽ \nСорт: арнеис\nОбъем: 0.187 \nПроизводитель: Dino Illuminati ", price: 2900, oldPrice: 18.0, filterIds: [6,11,16,22,32,72,82], imageURL: "red6", popularity: 50),
            Product(id: 6, name: "Красное Испанское Вино 1", desc: "Регион: Риоха \n3000 ₽ \nСорт: альянико\nОбъем: 1.5 \nПроизводитель: Adegas Gran Vinum ", price: 3000, oldPrice: 18.0, filterIds: [6,9,20,23,28,79,83], imageURL: "red3", popularity: 60),
            Product(id: 7, name: "Красное Испанское Вино 2", desc: "Регион: Ла Манча \n2100 ₽ \nСорт: алиберне\nОбъем: 1.5 \nПроизводитель: Bodegas Alion", price: 2100, oldPrice: 18.0, filterIds: [6,9,19,22,25,79,84], imageURL: "red4", popularity: 80),
            Product(id: 8, name: "Красное Испанское Вино 3", desc: "Регион: Валенсия\n15 000 ₽ \nСорт: бонарда\nОбъем: 0.375 \nПроизводитель: Bodegas Hermanos Sastre", price: 15000, oldPrice: 18.0, filterIds: [6,9,18,24,39,74,85], imageURL: "red5", popularity: 70)
        ]
    }
    
    
    
    
    static func list1() -> [Product] {
           return [
               Product(id: 9, name: "Белое Французское Шампанское", desc: "Регион: Бургундия \n999 ₽ \nСахар: полусладкое \nОбъем: 0.375 \nПроизводитель: Braida", price: 999, oldPrice: 12.0, filterIds: [96,100,104,116,120,128,134], imageURL: "redwine1", popularity: 100),
               
               Product(id: 10, name: "Белое Итальянское Шампанское", desc: "Регион: Пьемонт \n1700 ₽ \nСахар: полусухое\nОбъем: 0.73 \nПроизводитель: Casa Coste Piane", price: 1700, oldPrice: 14.0, filterIds: [96,99,106,117,121,129,135], imageURL: "white1", popularity: 40),
               
               Product(id: 11, name: "Розовое Испанское Шампанское", desc: "Регион: Валенсия \n60 000 ₽ \nСахар: сладкое\nОбъем: 0.73 \nПроизводитель: Chanoine", price: 60000, oldPrice: 15.0, filterIds: [97,98,109,122,131,136], imageURL: "pink", popularity: 75),
               
               Product(id: 12, name: "Розовое Французское Шампанское 2", desc: "Регион: Бургундия \n4500 ₽ \nСахар: сухое\nОбъем: 0.5 \nПроизводитель: Pierre Gimonnet & Fils", price: 4500, oldPrice: 16.0, filterIds:  [97,100,104,118,123,129,137], imageURL: "red2", popularity: 80),
               
               Product(id: 13, name: "Белое Итальянское Шампанское", desc: "Регион: Лацио \n650 ₽ \nСахар: полусладкое\nОбъем: 0.7 \nПроизводитель: Geoffroy", price: 650, oldPrice: 17.0, filterIds: [96,99,107,116,120,130,138], imageURL: "wine4", popularity: 30),
               
               Product(id: 14, name: "Розовое Итальянское Шампанское", desc: "Регион: Лацио \n2900 ₽ \nСахар: полусухое\nОбъем: 0.187 \nПроизводитель: Lanson", price: 2900, oldPrice: 18.0, filterIds: [97,99,107,117,121,126,139], imageURL: "red6", popularity: 50),
               
               Product(id: 15, name: "Розовое Испанское Шампанское 1", desc: "Регион: Риоха \n3000 ₽ \nСахар: сладкое\nОбъем: 1.5 \nПроизводитель: Jerome Prevost ", price: 3000, oldPrice: 18.0, filterIds: [97,98,111,118,122,133,140], imageURL: "red3", popularity: 60),
               
               Product(id: 16, name: "Розовое Испанское Шампанское 2", desc: "Регион: Ла Манча \n2100 ₽ \nСахар: сухое\nОбъем: 1.5 \nПроизводитель: Domaine Bott-Geyl", price: 2100, oldPrice: 18.0, filterIds: [97,98,110,117,123,133,141], imageURL: "red4", popularity: 80),
               
               Product(id: 17, name: "Белое Испанское Шампанское 3", desc: "Регион: Валенсия\n15 000 ₽ \nСахар: полусухое\nОбъем: 0.375 \nПроизводитель: Les Celliers Jean d'Alibert", price: 15000, oldPrice: 18.0, filterIds: [96,98,109,119,121,128,142], imageURL: "red5", popularity: 70)
           ]
       }
}
