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
            Product(id: 0, name: "Красное Французское Вино", desc: "Описание: \n Регион: Бургундия \n 999 ₽", price: 10.0, oldPrice: 12.0, filterIds: [6,10,13,21]),
            Product(id: 1, name: "Белое Итальянское Вино", desc: "Описание: \n Регион: Пьемонт \n 1700 ₽", price: 11.0, oldPrice: 14.0, filterIds: [7,11,15,22]),
            Product(id: 2, name: "Розовое Испанское Вино", desc: "Описание: \n Регион: Валенсия \n 60 000 ₽", price: 12.0, oldPrice: 15.0, filterIds: [8,9,18,24]),
            Product(id: 3, name: "Красное Французское Вино 2", desc: "Описание: \n Регион: Бургундия \n 4500 ₽", price: 13.0, oldPrice: 16.0, filterIds:  [6,10,13,23]),
            Product(id: 4, name: "Белое Итальянское Вино", desc: "Описание: \n Регион: Лацио \n 650 ₽", price: 14.0, oldPrice: 17.0, filterIds: [7,11,16,21]),
            Product(id: 5, name: "Красное Итальянское Вино", desc: "Описание: \n Регион: Лацио \n 2900 ₽", price: 15.0, oldPrice: 18.0, filterIds: [6,11,16,22]),
            Product(id: 6, name: "Красное Испанское Вино 1", desc: "Описание: \n Регион: Риоха \n 3000 ₽", price: 15.0, oldPrice: 18.0, filterIds: [6,9,20,23]),
            Product(id: 7, name: "Красное Испанское Вино 2", desc: "Описание: \n Регион: Ла Манча \n 2100 ₽", price: 15.0, oldPrice: 18.0, filterIds: [6,9,19,22]),
            Product(id: 8, name: "Красное Испанское Вино 3", desc: "Описание: \n Регион: Валенсия\n 15 000 ₽", price: 15.0, oldPrice: 18.0, filterIds: [6,9,18,24])
        ]
    }
}
