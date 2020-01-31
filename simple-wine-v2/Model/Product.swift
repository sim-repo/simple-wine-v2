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
            Product(id: 0, name: "Red", desc: "Red Desc", price: 10.0, oldPrice: 12.0, filterIds: [0,4]),
            Product(id: 1, name: "Yellow", desc: "Yellow Desc", price: 11.0, oldPrice: 14.0, filterIds: [0,4]),
            Product(id: 2, name: "Blue", desc: "Blue Desc", price: 12.0, oldPrice: 15.0, filterIds: [0,4]),
            Product(id: 3, name: "Orange", desc: "Orange Desc", price: 13.0, oldPrice: 16.0, filterIds: [0,4]),
            Product(id: 4, name: "Green", desc: "Green Desc", price: 14.0, oldPrice: 17.0, filterIds: [0,4]),
            Product(id: 5, name: "Purple", desc: "Purple Desc", price: 15.0, oldPrice: 18.0, filterIds: [0,4])
        ]
    }
}
