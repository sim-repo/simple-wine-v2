import Foundation


class Category {
    var id = 0
    var title = ""
    var imageURL: URL?
    
    init(id: Int, title: String, imageURL: URL){
        self.id = id
        self.title = title
        self.imageURL = imageURL
    }
    
    
    static func list() -> [Category] {
        return [
            Category(id: 0, title: "Вина", imageURL: URL(string: "wine")!),
            Category(id: 1, title: "Шампанское", imageURL: URL(string: "wine")!),
            Category(id: 2, title: "Водка", imageURL: URL(string: "wine")!),
            Category(id: 3, title: "Соки", imageURL: URL(string: "wine")!),
            Category(id: 3, title: "Соки", imageURL: URL(string: "wine")!),
            Category(id: 3, title: "Соки", imageURL: URL(string: "wine")!),
            Category(id: 3, title: "Соки", imageURL: URL(string: "wine")!),
            Category(id: 3, title: "Соки", imageURL: URL(string: "wine")!),
            Category(id: 3, title: "Соки", imageURL: URL(string: "wine")!),
            Category(id: 3, title: "Соки", imageURL: URL(string: "wine")!),
            Category(id: 3, title: "Соки", imageURL: URL(string: "wine")!),
            Category(id: 3, title: "Соки", imageURL: URL(string: "wine")!)
        ]
    }
}
