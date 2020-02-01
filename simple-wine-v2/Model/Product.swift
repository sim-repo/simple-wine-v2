import Foundation


class Product {
   
    
    var id = 0
    var name = ""
    var desc = ""
    var price: Double = 0
    var oldPrice: Double = 0
    var filterIds: [Int] = []
    var imageURL = ""
    
    init(id: Int, name: String, desc: String, price: Double, oldPrice: Double, filterIds: [Int], imageURL: String){
        self.id = id
        self.name = name
        self.desc = desc
        self.price = price
        self.oldPrice = oldPrice
        self.filterIds = filterIds
        self.imageURL = imageURL
    }

    
    static func list() -> [Product] {
        return [
            Product(id: 0, name: "Красное Французское Вино", desc: "Описание: \n Регион: Бургундия \n 999 ₽ \n Сорт: бьянколлела \n Объем: 0.375 \n Производитель: Chateau Brane-Cantenac", price: 10.0, oldPrice: 12.0, filterIds: [6,10,13,21,42,74,87], imageURL: "redwine1"),
            Product(id: 1, name: "Белое Итальянское Вино", desc: "Описание: \n Регион: Пьемонт \n 1700 ₽ \n Сорт: вердиккио\n Объем: 0.73 \n Производитель: Cantine Marisa Cuomo", price: 11.0, oldPrice: 14.0, filterIds: [7,11,15,22,45,77,80], imageURL: "white1"),
            Product(id: 2, name: "Розовое Испанское Вино", desc: "Описание: \n Регион: Валенсия \n 60 000 ₽ \n Сорт: гальоппо\n Объем: 0.73 \n Производитель: ", price: 12.0, oldPrice: 15.0, filterIds: [8,9,18,24,53,77], imageURL: "pink"),
            Product(id: 3, name: "Красное Французское Вино 2", desc: "Описание: \n Регион: Бургундия \n 4500 ₽ \n Сорт: барбера\n Объем: 0.5 \n Производитель: Chateau Fourcas Hosten", price: 13.0, oldPrice: 16.0, filterIds:  [6,10,13,23,34,75,88], imageURL: "red2"),
            Product(id: 4, name: "Белое Итальянское Вино", desc: "Описание: \n Регион: Лацио \n 650 ₽ \n Сорт: бонарда\n Объем: 0.7 \n Производитель: Capannelle", price: 14.0, oldPrice: 17.0, filterIds: [7,11,16,21,39,76,81], imageURL: "wine4"),
            Product(id: 5, name: "Красное Итальянское Вино", desc: "Описание: \n Регион: Лацио \n 2900 ₽ \n Сорт: арнеис\n Объем: 0.187 \n Производитель: Dino Illuminati ", price: 15.0, oldPrice: 18.0, filterIds: [6,11,16,22,32,72,82], imageURL: "red6"),
            Product(id: 6, name: "Красное Испанское Вино 1", desc: "Описание: \n Регион: Риоха \n 3000 ₽ \n Сорт: альянико\n Объем: 1.5 \n Производитель: Adegas Gran Vinum ", price: 15.0, oldPrice: 18.0, filterIds: [6,9,20,23,28,79,83], imageURL: "red3"),
            Product(id: 7, name: "Красное Испанское Вино 2", desc: "Описание: \n Регион: Ла Манча \n 2100 ₽ \n Сорт: алиберне\n Объем: 1.5 \n Производитель: Bodegas Alion", price: 15.0, oldPrice: 18.0, filterIds: [6,9,19,22,25,79,84], imageURL: "red4"),
            Product(id: 8, name: "Красное Испанское Вино 3", desc: "Описание: \n Регион: Валенсия\n 15 000 ₽ \n Сорт: бонарда\n Объем: 0.375 \n Производитель: Bodegas Hermanos Sastre", price: 15.0, oldPrice: 18.0, filterIds: [6,9,18,24,39,74,85], imageURL: "red5")
        ]
    }
}
