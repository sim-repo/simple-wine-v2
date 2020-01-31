import Foundation


class SelectedFilter {
    var id = 0
    var title = ""
    
    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
    
    static func list() -> [SelectedFilter] {
          return [
              SelectedFilter(id: 0, title: "Вина"),
              SelectedFilter(id: 1, title: "Шампанское"),
              SelectedFilter(id: 2, title: "Водка"),
              SelectedFilter(id: 3, title: "Соки"),
              
              SelectedFilter(id: 5, title: "Цвет"),
              SelectedFilter(id: 6, title: "Страна"),
              SelectedFilter(id: 7, title: "Цена"),
              SelectedFilter(id: 8, title: "Сорт Винограда"),
              SelectedFilter(id: 9, title: "Объем"),
              SelectedFilter(id: 10, title: "Производитель")
          ]
      }
}
