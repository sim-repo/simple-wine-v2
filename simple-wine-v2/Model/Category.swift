import Foundation


class Category {
    
    var id = 0
    var title = ""
    var imageURL = ""
    
    init(id: Int, title: String, imageURL: String){
        self.id = id
        self.title = title
        self.imageURL = imageURL
    }
    
    
    static func list() -> [Category] {
        return [
            Category(id: 0, title: "Вино", imageURL: "logo-wines2"),
            Category(id: 1, title: "Шампанское и Игристое",  imageURL: "shampane-logo"),
            Category(id: 2, title: "Крепкие Напитки",  imageURL: "drink-logo"),
            Category(id: 3, title: "Винные Сеты",  imageURL: "Set-Logo"),
            Category(id: 4, title: "Вода и Соки",  imageURL: "juice"),
        ]
    }
}
