import Foundation


class Product {
   
    var id = 0
    var name = ""
    var categoryId = 0
    var desc = ""
    var bigDesc = "Вина из Франции ценятся очень высоко и считаются эталоном среди других алкогольных напитков. Легендарные производители Бордо, Бургундии, Прованса и других винодельческих областей известны своими восхитительными французскими винами всему миру. В ассортименте интернет-витрины SimpleWine представлены хорошие демократичные и великолепные премиальные экземпляры от одних из лучших хозяйств страны."
    var price: Double = 0
    var oldPrice: Double = 0
    var popularity = 0
    var attributeIds: [Int] = []
    var imageURL = ""
    var manufactureYear: Int
    
    // non-server fields
    var isLiked = false
    
    
    init(id: Int, name: String, categoryId: Int, desc: String, price: Double, oldPrice: Double, attributeIds: [Int], imageURL: String, popularity: Int, manufactureYear: Int){
        self.id = id
        self.name = name
        self.categoryId = categoryId
        self.desc = desc
        self.price = price
        self.oldPrice = oldPrice
        self.attributeIds = attributeIds
        self.imageURL = imageURL
        self.popularity = popularity
        self.manufactureYear = manufactureYear
    }

    
    static func list0() -> [Product] {
        return [
            Product(id: 0, name: "Красное Французское Вино", categoryId: 0, desc: "Год: 2015г.\nРегион: Бургундия \n999 ₽ \nСорт: бьянколлела \nОбъем: 0.375 \nПроизводитель: Chateau Brane-Cantenac", price: 999, oldPrice: 12.0, attributeIds: [6,10,13,21,42,74,87], imageURL: "redwine1", popularity: 100, manufactureYear: 2015),
            
            Product(id: 1, name: "Белое Итальянское Вино", categoryId: 0, desc: "Год: 2012г.\nРегион: Пьемонт \n1700 ₽ \nСорт: вердиккио\nОбъем: 0.73 \nПроизводитель: Cantine Marisa Cuomo", price: 1700, oldPrice: 14.0, attributeIds: [7,11,15,22,45,77,80], imageURL: "white1", popularity: 40, manufactureYear: 2012),
            
            Product(id: 2, name: "Розовое Испанское Вино", categoryId: 0, desc: "Год: 2019г.\nРегион: Валенсия \n60 000 ₽ \nСорт: гальоппо\nОбъем: 0.73 \nПроизводитель: ", price: 60000, oldPrice: 15.0, attributeIds: [8,9,18,24,53,77], imageURL: "pink", popularity: 75, manufactureYear: 2019),
            
            Product(id: 3, name: "Красное Французское Вино 2", categoryId: 0, desc: "Год: 2016г.\nРегион: Бургундия \n4500 ₽ \nСорт: барбера\nОбъем: 0.5 \nПроизводитель: Chateau Fourcas Hosten", price: 4500, oldPrice: 16.0, attributeIds:  [6,10,13,23,34,75,88], imageURL: "red2", popularity: 80, manufactureYear: 2016),
            
            Product(id: 4, name: "Белое Итальянское Вино", categoryId: 0, desc: "Год: 2016г.\nРегион: Лацио \n650 ₽ \nСорт: бонарда\nОбъем: 0.7 \nПроизводитель: Capannelle", price: 650, oldPrice: 17.0, attributeIds: [7,11,16,21,39,76,81], imageURL: "wine4", popularity: 30, manufactureYear: 2016),
            
            Product(id: 5, name: "Красное Итальянское Вино", categoryId: 0, desc: "Год: 2013г.\nРегион: Лацио \n2900 ₽ \nСорт: арнеис\nОбъем: 0.187 \nПроизводитель: Dino Illuminati ", price: 2900, oldPrice: 18.0, attributeIds: [6,11,16,22,32,72,82], imageURL: "red6", popularity: 50, manufactureYear: 2013),
            
            Product(id: 6, name: "Красное Испанское Вино 1", categoryId: 0, desc: "Год: 2011г.\nРегион: Риоха \n3000 ₽ \nСорт: альянико\nОбъем: 1.5 \nПроизводитель: Adegas Gran Vinum ", price: 3000, oldPrice: 18.0, attributeIds: [6,9,20,23,28,79,83], imageURL: "red3", popularity: 60, manufactureYear: 2011),
            
            Product(id: 7, name: "Красное Испанское Вино 2", categoryId: 0, desc: "Год: 2010г.\nРегион: Ла Манча \n2100 ₽ \nСорт: алиберне\nОбъем: 1.5 \nПроизводитель: Bodegas Alion", price: 2100, oldPrice: 18.0, attributeIds: [6,9,19,22,25,79,84], imageURL: "red4", popularity: 80, manufactureYear: 2010),
            
            Product(id: 8, name: "Красное Испанское Вино 3", categoryId: 0, desc: "Год: 2005г.\nРегион: Валенсия\n15 000 ₽ \nСорт: бонарда\nОбъем: 0.375 \nПроизводитель: Bodegas Hermanos Sastre", price: 15000, oldPrice: 18.0, attributeIds: [6,9,18,24,39,74,85], imageURL: "red5", popularity: 70, manufactureYear: 2005)
        ]
    }
    
    
    
    
    static func list1() -> [Product] {
           return [
               Product(id: 9, name: "Белое Французское Шампанское", categoryId: 1, desc: "Год: 1990г.\nРегион: Бургундия \n999 ₽ \nСахар: полусладкое \nОбъем: 0.375 \nПроизводитель: Braida", price: 999, oldPrice: 12.0, attributeIds: [96,100,104,116,120,128,134], imageURL: "redwine1", popularity: 100, manufactureYear: 1990),
               
               Product(id: 10, name: "Белое Итальянское Шампанское", categoryId: 1, desc: "Год: 2003г.\nРегион: Пьемонт \n1700 ₽ \nСахар: полусухое\nОбъем: 0.73 \nПроизводитель: Casa Coste Piane", price: 1700, oldPrice: 14.0, attributeIds: [96,99,106,117,121,129,135], imageURL: "white1", popularity: 40, manufactureYear: 2003),
               
               Product(id: 11, name: "Розовое Испанское Шампанское", categoryId: 1, desc: "Год: 2006г.\nРегион: Валенсия \n60 000 ₽ \nСахар: сладкое\nОбъем: 0.73 \nПроизводитель: Chanoine", price: 60000, oldPrice: 15.0, attributeIds: [97,98,109,122,131,136], imageURL: "pink", popularity: 75, manufactureYear: 2006),
               
               Product(id: 12, name: "Розовое Французское Шампанское 2", categoryId: 1, desc: "Год: 2015г.\nРегион: Бургундия \n4500 ₽ \nСахар: сухое\nОбъем: 0.5 \nПроизводитель: Pierre Gimonnet & Fils", price: 4500, oldPrice: 16.0, attributeIds:  [97,100,104,118,123,129,137], imageURL: "red2", popularity: 80, manufactureYear: 2015),
               
               Product(id: 13, name: "Белое Итальянское Шампанское", categoryId: 1, desc: "Год: 2011г.\nРегион: Лацио \n650 ₽ \nСахар: полусладкое\nОбъем: 0.7 \nПроизводитель: Geoffroy", price: 650, oldPrice: 17.0, attributeIds: [96,99,107,116,120,130,138], imageURL: "wine4", popularity: 30, manufactureYear: 2011),
               
               Product(id: 14, name: "Розовое Итальянское Шампанское", categoryId: 1, desc: "Год: 2008г.\nРегион: Лацио \n2900 ₽ \nСахар: полусухое\nОбъем: 0.187 \nПроизводитель: Lanson", price: 2900, oldPrice: 18.0, attributeIds: [97,99,107,117,121,126,139], imageURL: "red6", popularity: 50, manufactureYear: 2008),
               
               Product(id: 15, name: "Розовое Испанское Шампанское 1", categoryId: 1, desc: "Год: 2007г.\nРегион: Риоха \n3000 ₽ \nСахар: сладкое\nОбъем: 1.5 \nПроизводитель: Jerome Prevost ", price: 3000, oldPrice: 18.0, attributeIds: [97,98,111,118,122,133,140], imageURL: "red3", popularity: 60, manufactureYear: 2007),
               
               Product(id: 16, name: "Розовое Испанское Шампанское 2", categoryId: 1, desc: "Год: 2005г.\nРегион: Ла Манча \n2100 ₽ \nСахар: сухое\nОбъем: 1.5 \nПроизводитель: Domaine Bott-Geyl", price: 2100, oldPrice: 18.0, attributeIds: [97,98,110,117,123,133,141], imageURL: "red4", popularity: 80, manufactureYear: 2005),
               
               Product(id: 17, name: "Белое Испанское Шампанское 3", categoryId: 1, desc: "Год: 2005г.\nРегион: Валенсия\n15 000 ₽ \nСахар: полусухое\nОбъем: 0.375 \nПроизводитель: Les Celliers Jean d'Alibert", price: 15000, oldPrice: 18.0, attributeIds: [96,98,109,119,121,128,142], imageURL: "red5", popularity: 70, manufactureYear: 2005)
           ]
       }
}
