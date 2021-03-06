import Foundation

enum SortEnum: String, CaseIterable {
    case ourCase = "Наш Выбор"
    case popularity = "По Популярности"
    case priceUp = "Цена по Возрастанию"
    case priceDown = "Цена по Убыванию"
    case manufactureUp = "Год по Возрастанию"
    case manufactureDown = "Год по Убыванию"
}
