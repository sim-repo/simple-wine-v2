import Foundation


class Product {
   
    
    var id = 0
    var name = ""
    var desc = ""
    var price: Double = 0
    var oldPrice: Double = 0
    var filterIds: [Int] = []
    
    
    init(id: Int, name: String, desc: String, price: Double, oldPrice: Double, filterIds: [Int]){
        self.id = id
        self.name = name
        self.desc = desc
        self.price = price
        self.oldPrice = oldPrice
        self.filterIds = filterIds
    }
    
    static func list() -> [Product] {
        return [
            Product(id: 0, name: "Красное Французское Вино", desc: "Описание: Бургундия", price: 10.0, oldPrice: 12.0, filterIds: [6,10,13]),
            Product(id: 1, name: "Белое Итальянское Вино", desc: "Описание: Пьемонт", price: 11.0, oldPrice: 14.0, filterIds: [7,11,15]),
            Product(id: 2, name: "Розовое Испанское Вино", desc: "Описание: Валенсия", price: 12.0, oldPrice: 15.0, filterIds: [8,9,18]),
            Product(id: 3, name: "Красное Французское Вино 2", desc: "Описание: Бургундия", price: 13.0, oldPrice: 16.0, filterIds:  [6,10,13]),
            Product(id: 4, name: "Белое Итальянское Вино", desc: "Описание: Лацио", price: 14.0, oldPrice: 17.0, filterIds: [7,11,16]),
            Product(id: 5, name: "Красное Итальянское Вино", desc: "Описание: Лацио", price: 15.0, oldPrice: 18.0, filterIds: [6,11,16])
        ]
    }
}
