import Foundation


protocol CategoryFilterProtocol {
    func getLevel0()->[String]
    func getLevel1(by indexOfLevel0: Int) -> [String]
    func getLevel2(by indexOfLevel0: Int, by indexOfLevel1: Int) -> [String]
    
    
    func getLevel1Price(by indexOfLevel0: Int) -> [String]
}

class TestData2 {
    
    private init(){}
    static var shared = TestData2()
    
    var categories: [Category] = getCategories()
    var products: [Product] = []
    var filters: [Filter] = []
    var productId = 0
    var filterId = 0
    var kindId = 0
    
    var filterCategories: [CategoryFilterProtocol] = [FilterCategory0(), FilterCategory1(), FilterCategory2(), FilterCategory3(), FilterCategory4(), FilterCategory5()]
    
    
    // point independed
    static func getCategories() -> [Category] {
        return [
            Category(id: 0, title: "Игристое", pointEnum: .grandcru),
            Category(id: 1, title: "Шампанское", pointEnum: .grandcru),
            Category(id: 2, title: "Вино", pointEnum: .grandcru),
            Category(id: 3, title: "Десертное", pointEnum: .grandcru),
            Category(id: 4, title: "Half-Bottle", pointEnum: .grandcru),
            Category(id: 5, title: "Magnum",  pointEnum: .grandcru),
            
            Category(id: 6, title: "Игристое",  pointEnum: .kuznetskiymost),
            Category(id: 7, title: "Шампанское",  pointEnum: .kuznetskiymost),
            Category(id: 8, title: "Вино",  pointEnum: .kuznetskiymost),
            Category(id: 9, title: "Десертное", pointEnum: .kuznetskiymost),
            Category(id: 10, title: "Half-Bottle",  pointEnum: .kuznetskiymost),
            Category(id: 11, title: "Magnum",  pointEnum: .kuznetskiymost),
            
            Category(id: 12, title: "Игристое",  pointEnum: .depo),
            Category(id: 13, title: "Шампанское",  pointEnum: .depo),
            Category(id: 14, title: "Вино",   pointEnum: .depo),
            Category(id: 15, title: "Десертное",  pointEnum: .depo),
            Category(id: 16, title: "Half-Bottle",  pointEnum: .depo),
            Category(id: 17, title: "Magnum",  pointEnum: .depo)
        ]
    }
    
    
    func start() {
        createFilter(pointEnum: .grandcru)
        createFilter(pointEnum: .kuznetskiymost)
        createFilter(pointEnum: .depo)
        
        
        
        //        for filter in filters {
        //            print("category: \(filter.categoryId), filter: \(filter.id), title: \(filter.title), parent: \(filter.parentId)")
        //        }
        //
        //        for product in products {
        //            print("name: \(product.name), desc: \(product.price), attr: \(product.desc)")
        //        }
        //
        let points = Point.list()
        let mapSettings = DetailMapSetting.list()
        
        let response = Response(points: points, categories: categories, filters: filters, products: products, detailMapSetting: mapSettings)
        TestParse.shared.encode(response: response)
    }
    
    
    
    // "Игристое"
    class FilterCategory0: CategoryFilterProtocol {
        
        
        func getLevel0() -> [String] {
            return ["Белое","Розовое","Десертное","Magnum"]
        }
        
        func getLevel1(by indexOfLevel0: Int) -> [String] {
            switch indexOfLevel0 {
            case 0:
                return ["Испания", "Италия", "Франция"]
            case 1:
                return ["Италия", "Соединенное Королевство"]
            case 2:
                return ["Италия"]
            case 3:
                return ["Италия"]
            default:
                break
            }
            return []
        }
        
        func getLevel2(by indexOfLevel0: Int, by indexOfLevel1: Int) -> [String] {
            return []
        }
        
        func getLevel1Price(by indexOfLevel0: Int) -> [String] {
            return ["до 1 500 ₽", "от 1 500 до 3 000 ₽", "от 3 000 до 10 000 ₽", "от 10 000 ₽"]
        }
    }
    
    
    // "Шампанское"
    class FilterCategory1: CategoryFilterProtocol {
        
        func getLevel0() -> [String] {
            return ["Белое","Розовое"]
        }
        
        func getLevel1(by indexOfLevel0: Int) -> [String] {
            switch indexOfLevel0 {
            case 0:
                return ["N/V Brut", "N/V Demisec", "Vintage"]
            case 1:
                return ["N/V Brut", "Vintage"]
            default:
                break
            }
            return []
        }
        
        func getLevel2(by indexOfLevel0: Int, by indexOfLevel1: Int) -> [String] {
            return []
        }
        
        func getLevel1Price(by indexOfLevel0: Int) -> [String] {
            return ["до 1 500 ₽", "от 1 500 до 3 000 ₽", "от 3 000 до 10 000 ₽", "от 10 000 ₽"]
        }
    }
    
    // "Вино"
    class FilterCategory2: CategoryFilterProtocol  {
        
        func getLevel0() -> [String] {
            return ["Белое","Розовое","Красное","Десертное","Half-bottle","Magnum"]
        }
        
        func getLevel1(by indexOfLevel0: Int) -> [String] {
            switch indexOfLevel0 {
            case 0:
                return ["Австралия","Австрия","Аргентина","Венгрия","Германия", "Италия", "Испания", "Франция", "Чили"]
            case 1:
                return [ "Италия", "Испания", "Сербия", "Франция"]
            case 2:
                return ["Австралия","Австрия","Аргентина","Германия", "Грузия", "Израиль", "Италия", "Испания", "Новая Зеландия" ,"Франция", "Чили"]
            case 3:
                return ["Германия", "Италия", "Испания", "Португалия" ,"Франция"]
            case 4:
                return ["Германия", "Италия", "Соединенные Штаты Америки", "Франция"]
            case 5:
                return ["Испания", "Италия", "Франция"]
            default:
                break
            }
            return []
        }
        
        
        func getLevel2_0(by indexOfLevel1: Int) -> [String] {
            
            switch indexOfLevel1 {
            case 0:
                return ["Южная Австралия","Тасмания"]
            case 1:
                return [ "Baxay", "Нижняя Австрия"]
            case 2:
                return ["Мендоса"]
            case 3:
                return ["Токай"]
            case 4:
                return ["Мозель", "Рейнгау", "Рейнгессен", "Франкония"]
            case 5:
                return ["Фриули-Венеция-Джулия", "Сицилия", "Пьемонт", "Трентино-Альто Адидже", "Тоскана", "Венето", "Кампания", "Марксе", "Ломбардия", "Сардиния", "Калабрия", "Все Регионы"]
            case 6:
                return ["Галисия","Кастилья и Леон", "Наварра", "Риоха"]
            case 7:
                return ["Бургундия","Эльзас", "Долина Луары", "Бордо","Долина Роны", "Прованс"]
            case 8:
                return ["Аконгуа","Центральная Долина"]
            default:
                break
            }
            return []
        }
        
        
        func getLevel2_1(by indexOfLevel1: Int) -> [String] {
            
            switch indexOfLevel1 {
            case 0:
                return ["Наварра"]
            case 1:
                return ["Тоскана"]
            case 2:
                return ["Шумандия"]
            case 3:
                return ["Бургундия","Эльзас", "Долина Луары", "Бордо","Долина Роны", "Прованс"]
            default:
                break
            }
            return []
        }
        
        
        func getLevel2_2(by indexOfLevel1: Int) -> [String] {
            
            switch indexOfLevel1 {
            case 0:
                return ["Южная Австралия","Тасмания"]
            case 1:
                return [ "Бургенладн"]
            case 2:
                return ["Мендоса", "Патагония"]
            case 4:
                return ["Кахетия"]
            case 5:
                return ["Галилея", "Иудейские Храмы"]
            case 6:
                return ["Фриули-Венеция-Джулия", "Сицилия", "Пьемонт", "Трентино-Альто Адидже", "Тоскана", "Венето", "Кампания", "Марксе", "Ломбардия", "Сардиния", "Калабрия", "Все Регионы"]
            case 7:
                return ["Галисия","Кастилья и Леон", "Каталония", "Наварра", "Риоха"]
            case 8:
                return ["Мальборо","Хокс Бей", "Центральное Отаго"]
            case 9:
                return ["Бургундия","Эльзас", "Долина Луары", "Бордо","Долина Роны", "Прованс"]
            case 10:
                return ["Аконгуа","Центральная Долина"]
            default:
                break
            }
            return []
        }
        
        func getLevel2(by indexOfLevel0: Int, by indexOfLevel1: Int) -> [String] {
            switch indexOfLevel0 {
            case 0:
                return getLevel2_0(by: indexOfLevel1)
            case 1:
                return getLevel2_1(by: indexOfLevel1)
            case 2:
                return getLevel2_2(by: indexOfLevel1)
            default: break
            }
            
            return []
        }
        
        func getLevel1Price(by indexOfLevel0: Int) -> [String] {
            return ["до 1 500 ₽", "от 1 500 до 3 000 ₽", "от 3 000 до 10 000 ₽", "от 10 000 ₽"]
        }
    }
    
    
    
    
    
    // "Десертное"
    class FilterCategory3: CategoryFilterProtocol  {
        
        func getLevel0() -> [String] {
            return ["Игристое","Белое вино","Half-bottle"]
        }
        
        func getLevel1(by indexOfLevel0: Int) -> [String] {
            switch indexOfLevel0 {
            case 0:
                return ["Италия"]
            case 1:
                return ["Германия", "Италия","Франция"]
            case 2:
                return ["Германия", "Италия","Соединенные Штаты Америки", "Франция"]
            default:
                break
            }
            return []
        }
        
        func getLevel2(by indexOfLevel0: Int, by indexOfLevel1: Int) -> [String] {
            return []
        }
        
        func getLevel1Price(by indexOfLevel0: Int) -> [String] {
            return ["до 1 500 ₽", "от 1 500 до 3 000 ₽", "от 3 000 до 10 000 ₽", "от 10 000 ₽"]
        }
    }
    
    
    // "Half-Bottle"
    class FilterCategory4: CategoryFilterProtocol {
        
        func getLevel0() -> [String] {
            return ["Белое Вино","Красное вино","Десертное"]
        }
        
        func getLevel1(by indexOfLevel0: Int) -> [String] {
            switch indexOfLevel0 {
            case 0:
                return ["Германия", "Италия","Соединенные Штаты Америки", "Франция"]
            case 1:
                return ["Италия","Соединенные Штаты Америки", "Франция"]
            case 2:
                return ["Германия", "Италия","Соединенные Штаты Америки", "Франция"]
            default:
                break
            }
            return []
        }
        
        func getLevel2(by indexOfLevel0: Int, by indexOfLevel1: Int) -> [String] {
            return []
        }
        
        func getLevel1Price(by indexOfLevel0: Int) -> [String] {
            return ["до 1 500 ₽", "от 1 500 до 3 000 ₽", "от 3 000 до 10 000 ₽", "от 10 000 ₽"]
        }
    }
    
    // "Magnum"
    class FilterCategory5: CategoryFilterProtocol {
        
        func getLevel0() -> [String] {
            return ["Игристое","Белое вино","Розовое вино","Красное вино"]
        }
        
        func getLevel1(by indexOfLevel0: Int) -> [String] {
            switch indexOfLevel0 {
            case 0:
                return ["Италия"]
            case 1:
                return ["Италия","Франция"]
            case 2:
                return ["Франция"]
            case 3:
                return ["Испания", "Италия","Франция"]
            default:
                break
            }
            return []
        }
        
        func getLevel2(by indexOfLevel0: Int, by indexOfLevel1: Int) -> [String] {
            return []
        }
        
        func getLevel1Price(by indexOfLevel0: Int) -> [String] {
            return ["до 1 500 ₽", "от 1 500 до 3 000 ₽", "от 3 000 до 10 000 ₽", "от 10 000 ₽"]
        }
    }
    
    
    
    
    
    private func createFilter(pointEnum: PointEnum) {
        
        let currentCategories = categories.filter({$0.pointEnum == pointEnum})
        
        
        for (categoryIndex, filterCategory) in filterCategories.enumerated() {
            
            let currentCategory = currentCategories[categoryIndex]
            
            for (level0FilterIndex, level0FilterTitle) in filterCategory.getLevel0().enumerated() {
                kindId += 1
                let filterLevel0 = Filter(id: filterId, pointEnum: pointEnum, title: level0FilterTitle, parentId: nil, level: 0, parentTitle: nil, kind: kindId, categoryId: currentCategory.id)
                filterLevel0.volume = .v_075
                filters.append(filterLevel0)
                filterId += 1
                
                
                
                if filterCategory.getLevel1(by: level0FilterIndex).count == 0 {
                    for _ in 0...2 {
                        let product = createProduct(name: level0FilterTitle + " #\(productId)",
                            categoryId: currentCategory.id,
                            filterId: filterLevel0.id,
                            pointEnum: pointEnum)
                        products.append(product)
                    }
                }
                
                
                for (level1FilterIndex, level1FilterTitle) in filterCategory.getLevel1Price(by: level0FilterIndex).enumerated() {
                    let filterLevelPrice = Filter(id: filterId, pointEnum: pointEnum, title: level1FilterTitle, parentId: filterLevel0.id, level: 1, parentTitle: filterLevel0.title, kind: kindId, categoryId: currentCategory.id)
                    filterLevelPrice.isPrice = true
                    filterLevelPrice.volume = .v_075
                    filters.append(filterLevelPrice)
                    filterId += 1
                    
                    for (level2FilterIndex, level2FilterTitle) in filterCategory.getLevel1(by: level1FilterIndex).enumerated() {
                        let filterLevel2 = Filter(id: filterId, pointEnum: pointEnum, title: level2FilterTitle, parentId: filterLevelPrice.id, level: 2, parentTitle: filterLevelPrice.title, kind: kindId, categoryId: currentCategory.id)
                        filterLevel2.volume = .v_075
                        filterLevel2.isPrice = true
                        filters.append(filterLevel2)
                        filterId += 1
                        
                        for _ in 0...2 {
                            let product = createProduct(name: level0FilterTitle + " #\(productId)",
                                categoryId: currentCategory.id,
                                filterId: filterLevel0.id,
                                pointEnum: pointEnum)
                            addAttribute(product: product, filterId: filterLevelPrice.id, attrName: "Цена", attrValue: level1FilterTitle)
                            addAttribute(product: product, filterId: filterLevel2.id, attrName: level0FilterTitle, attrValue: level2FilterTitle)
                            products.append(product)
                        }
                    }
                }
                
                
                
                
                
                
                
                
                
                for (level1FilterIndex, level1FilterTitle) in filterCategory.getLevel1(by: level0FilterIndex).enumerated() {
                    let filterLevel1 = Filter(id: filterId, pointEnum: pointEnum, title: level1FilterTitle, parentId: filterLevel0.id, level: 1, parentTitle: filterLevel0.title, kind: kindId, categoryId: currentCategory.id)
                    filterLevel1.volume = .v_075
                    filters.append(filterLevel1)
                    
                    
                    if filterCategory.getLevel2(by: level0FilterIndex, by: level1FilterIndex).count == 0 {
                        for _ in 0...2 {
                            let product = createProduct(name: level0FilterTitle + " #\(productId)",
                                categoryId: currentCategory.id,
                                filterId: filterLevel0.id,
                                pointEnum: pointEnum)
                            addAttribute(product: product, filterId: filterLevel1.id, attrName: level0FilterTitle, attrValue: level1FilterTitle)
                            products.append(product)
                        }
                    }
                    
                    filterId += 1
                    
                    
                    
                    for (_, level2FilterTitle) in filterCategory.getLevel2(by: level0FilterIndex, by: level1FilterIndex).enumerated() {
                        let filterLevel2 = Filter(id: filterId, pointEnum: pointEnum, title: level2FilterTitle, parentId: filterLevel1.id, level: 2, parentTitle: filterLevel1.title, kind: kindId, categoryId: currentCategory.id)
                        filterLevel2.volume = .v_075
                        filters.append(filterLevel2)
                        for _ in 0...2 {
                            let product = createProduct(name: level0FilterTitle + " #\(productId)",
                                categoryId: currentCategory.id,
                                filterId: filterLevel0.id,
                                pointEnum: pointEnum)
                            
                            addAttribute(product: product, filterId: filterLevel1.id, attrName: level0FilterTitle, attrValue: level1FilterTitle)
                            addAttribute(product: product, filterId: filterLevel2.id, attrName: level1FilterTitle, attrValue: level2FilterTitle)
                            products.append(product)
                        }
                        filterId += 1
                    }
                }
            }
        }
        
        
        for product in products {
            let rootFilterId = product.attributeIds.first
            let priceFilters = filters.filter{$0.parentId == rootFilterId && $0.isPrice == true}
            
            var filter: Filter?
            
            switch product.price {
            case 0..<1500:
                filter = priceFilters.first{$0.title == "до 1 500 ₽"}
            case 1500..<3000:
                filter = priceFilters.first{$0.title == "от 1 500 до 3 000 ₽"}
            case 3000..<10000:
                filter = priceFilters.first{$0.title == "от 3 000 до 10 000 ₽"}
            case 10000...:
                filter = priceFilters.first{$0.title == "от 10 000 ₽"}
            default:
                break
            }
            if let f = filter {
                addAttribute(product: product, filterId: f.id, attrName: "", attrValue: f.title)
            }
        }
        
    }
    
    private func createProduct(name: String,
                               categoryId: Int,
                               filterId: Int,
                               pointEnum: PointEnum
    ) -> Product {
        
        let popularity = Int.random(in: 0 ..< 100)
        let year = Int.random(in: 1985 ..< 2019)
        let price = Int.random(in: 250 ..< 20000)
        let oldPrice = Int.random(in: 250 ..< 20000)
        
        let product = Product(id: productId,
                              name: name,
                              pointEnum: pointEnum,
                              categoryId: categoryId,
                              desc: "",
                              price: Double(price),
                              oldPrice: Double(price + 300),
                              attributeIds: [filterId],
                              imageURL: "http://185.219.42.85:3000/Images/red2.png",
                              popularity: popularity,
                              manufactureYear: year)
        productId += 1
        return product
    }
    
    
    
    private func addAttribute(product: Product,
                              filterId: Int,
                              attrName: String,
                              attrValue: String) {
        
        if attrName == "Цена" {
            switch attrValue {
            case "до 1 500 ₽": product.price = Double(Int.random(in: 250 ..< 1500))
            case "от 1 500 до 3 000 ₽": product.price = Double(Int.random(in: 1500 ..< 3000))
            case "от 3 000 до 5 000 ₽": product.price = Double(Int.random(in: 3000 ..< 5000))
            case "от 10 000 ₽": product.price = Double(Int.random(in: 10000 ..< 30000))
            default:
                break
            }
            
            product.attributeIds.append(filterId)
            product.desc += "\n\(attrName): \(Int(product.price)) ₽"
            
        } else {
            product.attributeIds.append(filterId)
            if product.desc != ""  {
                product.desc += ", \(attrValue)"
            } else {
                product.desc += "\(attrValue)"
            }
        }
        
    }
    
}
