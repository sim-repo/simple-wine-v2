import Foundation


protocol CategoryFilterProtocol {
    func getLevel0()->[String]
    func getLevel1(by indexOfLevel0: Int) -> [String]
    func getLevel2(by indexOfLevel0: Int, by indexOfLevel1: Int) -> [String]
    func getProductNameEng()->[String]
    func getProductNameRU()->[String]
    func getColor()->[ProductColorEnum]
    
    func getLevel1Price(by indexOfLevel0: Int) -> [String]
}

class TestData2 {
    
    private init(){}
    static var shared = TestData2()
    
    var categories: [Category] = getClassicCategories()
    var priceCategories: [Category] = getPriceCategories()
    
    
    var products: [Product] = []
    var filters: [Filter] = []
    var productId = 0
    var filterId = 0
    var kindId = 0
    
    var maxProducts = 2
    
    var iconByCountries: [String:String] = [:]
    
    
    var filterCategories: [CategoryFilterProtocol] = [FilterCategory0(), FilterCategory1(), FilterCategory2(), FilterCategory3(), FilterCategory4(), FilterCategory5()]
    
    
    // point independed
    static func getClassicCategories() -> [Category] {
        return [
            Category(id: 0, title: "Игристое", pointEnum: .grandcru, menuMapEnum: .classic),
            Category(id: 1, title: "Шампанское", pointEnum: .grandcru, menuMapEnum: .classic),
            Category(id: 2, title: "Вино", pointEnum: .grandcru, menuMapEnum: .classic),
            Category(id: 3, title: "Десертное", pointEnum: .grandcru, menuMapEnum: .classic),
            Category(id: 4, title: "Half-Bottle", pointEnum: .grandcru, menuMapEnum: .classic),
            Category(id: 5, title: "Magnum",  pointEnum: .grandcru, menuMapEnum: .classic),
            
            Category(id: 6, title: "Игристое",  pointEnum: .kuznetskiymost, menuMapEnum: .classic),
            Category(id: 7, title: "Шампанское",  pointEnum: .kuznetskiymost, menuMapEnum: .classic),
            Category(id: 8, title: "Вино",  pointEnum: .kuznetskiymost, menuMapEnum: .classic),
            Category(id: 9, title: "Десертное", pointEnum: .kuznetskiymost, menuMapEnum: .classic),
            Category(id: 10, title: "Half-Bottle",  pointEnum: .kuznetskiymost, menuMapEnum: .classic),
            Category(id: 11, title: "Magnum",  pointEnum: .kuznetskiymost, menuMapEnum: .classic),
            
            Category(id: 12, title: "Игристое",  pointEnum: .depo, menuMapEnum: .classic),
            Category(id: 13, title: "Шампанское",  pointEnum: .depo, menuMapEnum: .classic),
            Category(id: 14, title: "Вино",   pointEnum: .depo, menuMapEnum: .classic),
            Category(id: 15, title: "Десертное",  pointEnum: .depo, menuMapEnum: .classic),
            Category(id: 16, title: "Half-Bottle",  pointEnum: .depo, menuMapEnum: .classic),
            Category(id: 17, title: "Magnum",  pointEnum: .depo, menuMapEnum: .classic)
        ]
    }
    
    // point independed
    static func getPriceCategories() -> [Category] {
        return [
            Category(id: 18, title: "Игристое", pointEnum: .grandcru, menuMapEnum: .price),
            Category(id: 19, title: "Шампанское", pointEnum: .grandcru, menuMapEnum: .price),
            Category(id: 20, title: "Вино", pointEnum: .grandcru, menuMapEnum: .price),
            Category(id: 21, title: "Десертное", pointEnum: .grandcru, menuMapEnum: .price),
            Category(id: 22, title: "Half-Bottle", pointEnum: .grandcru, menuMapEnum: .price),
            Category(id: 23, title: "Magnum",  pointEnum: .grandcru, menuMapEnum: .price),
            
            Category(id: 24, title: "Игристое",  pointEnum: .kuznetskiymost, menuMapEnum: .price),
            Category(id: 25, title: "Шампанское",  pointEnum: .kuznetskiymost, menuMapEnum: .price),
            Category(id: 26, title: "Вино",  pointEnum: .kuznetskiymost, menuMapEnum: .price),
            Category(id: 27, title: "Десертное", pointEnum: .kuznetskiymost, menuMapEnum: .price),
            Category(id: 28, title: "Half-Bottle",  pointEnum: .kuznetskiymost, menuMapEnum: .price),
            Category(id: 29, title: "Magnum",  pointEnum: .kuznetskiymost, menuMapEnum: .price),
            
            Category(id: 30, title: "Игристое",  pointEnum: .depo, menuMapEnum: .price),
            Category(id: 31, title: "Шампанское",  pointEnum: .depo, menuMapEnum: .price),
            Category(id: 32, title: "Вино",   pointEnum: .depo, menuMapEnum: .price),
            Category(id: 33, title: "Десертное",  pointEnum: .depo, menuMapEnum: .price),
            Category(id: 34, title: "Half-Bottle",  pointEnum: .depo, menuMapEnum: .price),
            Category(id: 35, title: "Magnum",  pointEnum: .depo, menuMapEnum: .price)
        ]
    }
    
    
    
    
    func start() {
        
        iconByCountries["Австралия"] = "http://185.219.42.85:3000/Images/australia.png"
        iconByCountries["Аргентина"] = "http://185.219.42.85:3000/Images/argentina.png"
        iconByCountries["Германия"] = "http://185.219.42.85:3000/Images/german.png"
        iconByCountries["Грузия"] = "http://185.219.42.85:3000/Images/grusia.png"
        iconByCountries["Израиль"] = "http://185.219.42.85:3000/Images/israel.png"
        iconByCountries["Италия"] = "http://185.219.42.85:3000/Images/italy.png"
        iconByCountries["Испания"] = "http://185.219.42.85:3000/Images/spain.png"
        iconByCountries["Новая Зеландия"] = "http://185.219.42.85:3000/Images/newzeland.png"
        iconByCountries["Франция"] = "http://185.219.42.85:3000/Images/france.png"
        iconByCountries["Чили"] = "http://185.219.42.85:3000/Images/chili.png"
        iconByCountries["Соединенные Штаты Америки"] = "http://185.219.42.85:3000/Images/usa.png"
        iconByCountries["Сербия"] = "http://185.219.42.85:3000/Images/serb.png"

        
        createFilter(pointEnum: .grandcru)
        createFilter(pointEnum: .kuznetskiymost)
        createFilter(pointEnum: .depo)
        
        
        createFilterPrice(pointEnum: .grandcru)
        createFilterPrice(pointEnum: .kuznetskiymost)
        createFilterPrice(pointEnum: .depo)
        
        
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
        
        let allCategories = categories + priceCategories
        let response = Response(points: points, categories: allCategories, filters: filters, products: products, detailMapSetting: mapSettings)
        encode(response: response)
    }
    
    
    
    // "Игристое"
    class FilterCategory0: CategoryFilterProtocol {
        
        
        func getProductNameEng() -> [String] {
            return ["White","Pink","Dessert","Magnum"]
        }
        
        func getProductNameRU() -> [String] {
            ["Белое","Розовое","Десертное","Magnum"]
        }
        
        func getColor()->[ProductColorEnum] {
            return [.white, .pink, .red, .red]
        }
        
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
        
        func getProductNameEng() -> [String] {
            return ["White","Pink"]
        }
        
        func getProductNameRU() -> [String] {
            ["Белое","Розовое"]
        }
        
        func getColor()->[ProductColorEnum] {
            return [.white, .pink]
        }
        
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
        
        
        func getProductNameEng() -> [String] {
            return ["White", "Pink", "Red", "Dessert", "Half-bottle", "Magnum"]
        }
        
        func getProductNameRU() -> [String] {
            ["Белое","Розовое","Красное","Десертное","Half-bottle","Magnum"]
        }
        
        
        func getColor()->[ProductColorEnum] {
            return [.white, .pink, .red, .red, .red, .red]
        }
        
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
        
        
        func getProductNameEng() -> [String] {
            return ["Sparkling", "White Wine", "Half-bottle"]
        }
        
        func getProductNameRU() -> [String] {
            ["Игристое","Белое вино","Half-bottle"]
        }
        
        
        func getColor()->[ProductColorEnum] {
            return [.white, .white, .red]
        }
        
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
        
        
        
        
        func getProductNameEng() -> [String] {
            return ["White Wine", "Red Wine", "Dessert"]
        }
        
        func getProductNameRU() -> [String] {
            ["Белое Вино","Красное вино","Десертное"]
        }
        
        func getColor()->[ProductColorEnum] {
            return [.white, .red, .red]
        }
        
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
        
        
        func getProductNameEng() -> [String] {
            return ["Sparkling", "White Wine", "Rose Wine", "Red Wine"]
        }
        
        func getProductNameRU() -> [String] {
            ["Игристое","Белое вино","Розовое вино","Красное вино"]
        }
        
        func getColor()->[ProductColorEnum] {
            return [.white, .white, .pink, .red]
        }
        
        
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
    
    
    
    
    private func createFilterPrice(pointEnum: PointEnum) {
        
        let currentCategories = priceCategories.filter({$0.pointEnum == pointEnum})
        
        
        for (categoryIndex, filterCategory) in filterCategories.enumerated() {
            
            let currentCategory = currentCategories[categoryIndex]
            
            for (level0FilterIndex, level0FilterTitle) in filterCategory.getLevel0().enumerated() {
                
                let productNameENG = filterCategory.getProductNameEng()[level0FilterIndex]
                let productNameRU = filterCategory.getProductNameRU()[level0FilterIndex]
                let color = filterCategory.getColor()[level0FilterIndex]
                
                kindId += 1
                
                let filterLevel0 = Filter(id: filterId, pointEnum: pointEnum, menuMapEnum: .price, title: level0FilterTitle, parentId: nil, level: 0, parentTitle: nil, kind: kindId, categoryId: currentCategory.id)
                
                filterLevel0.volume = .v_075
                filters.append(filterLevel0)
                filterId += 1
                
                
                for (level1FilterIndex, level1FilterTitle) in filterCategory.getLevel1Price(by: level0FilterIndex).enumerated() {
                    
                    
                    let filterLevelPrice = Filter(id: filterId, pointEnum: pointEnum, menuMapEnum: .price, title: level1FilterTitle, parentId: filterLevel0.id, level: 1, parentTitle: filterLevel0.title, kind: kindId, categoryId: currentCategory.id)
                    
                    filterLevelPrice.volume = .v_075
                    filters.append(filterLevelPrice)
                    filterId += 1
                    
                    
                    
                    for (level2FilterIndex, level2FilterTitle) in filterCategory.getLevel1(by: level1FilterIndex).enumerated() {
                        
                        
                        let filterLevel2 = Filter(id: filterId, pointEnum: pointEnum, menuMapEnum: .price, title: level2FilterTitle, parentId: filterLevelPrice.id, level: 2, parentTitle: filterLevelPrice.title, kind: kindId, categoryId: currentCategory.id)
                        
                        
                        filterLevel2.volume = .v_075
                        filters.append(filterLevel2)
                        filterId += 1
                        
                        
                        let random = Int.random(in: 1 ..< maxProducts)
                        
                        for _ in 0...random {
                            let product = createProduct(
                                name: productNameENG + " #\(productId)",
                                nameRU: productNameRU + " #\(productId)",
                                categoryId: currentCategory.id,
                                filterId: filterLevel0.id,
                                pointEnum: pointEnum,
                                menuMapEnum: .price,
                                volume: "0.75",
                                color: color,
                                sugar: getSugar())
                            addAttribute(product: product, filterId: filterLevelPrice.id, attrName: "Цена", attrValue: level1FilterTitle)
                            addAttribute(product: product, filterId: filterLevel2.id, attrName: level0FilterTitle, attrValue: level2FilterTitle)
                            addCountry(product: product, country: level2FilterTitle)
                            products.append(product)
                        }
                    }
                }
            }
        }
        
    }
    
    
    
    
    private func createFilter(pointEnum: PointEnum) {
        
        let currentCategories = categories.filter({$0.pointEnum == pointEnum})
        
        
        for (categoryIndex, filterCategory) in filterCategories.enumerated() {
            
            let currentCategory = currentCategories[categoryIndex]
            
            for (level0FilterIndex, level0FilterTitle) in filterCategory.getLevel0().enumerated() {
                
                let productNameENG = filterCategory.getProductNameEng()[level0FilterIndex]
                let productNameRU = filterCategory.getProductNameRU()[level0FilterIndex]
                let color = filterCategory.getColor()[level0FilterIndex]
                
                
                
                kindId += 1
                
                let filterLevel0 = Filter(id: filterId, pointEnum: pointEnum, menuMapEnum: .classic, title: level0FilterTitle, parentId: nil, level: 0, parentTitle: nil, kind: kindId, categoryId: currentCategory.id)
                
                filterLevel0.volume = .v_075
                filters.append(filterLevel0)
                filterId += 1
                
                
                
                if filterCategory.getLevel1(by: level0FilterIndex).count == 0 {
                    
                    let random = Int.random(in: 1 ..< maxProducts)
                    
                    for _ in 0...random {
                        let product = createProduct(
                            name: productNameENG + " #\(productId)",
                            nameRU: productNameRU + " #\(productId)",
                            categoryId: currentCategory.id,
                            filterId: filterLevel0.id,
                            pointEnum: pointEnum,
                             menuMapEnum: .classic,
                            volume: "0.75",
                            color: color,
                            sugar: getSugar()
                        )
                        products.append(product)
                    }
                }
                
                
                for (level1FilterIndex, level1FilterTitle) in filterCategory.getLevel1(by: level0FilterIndex).enumerated() {
                    let filterLevel1 = Filter(id: filterId, pointEnum: pointEnum, menuMapEnum: .classic, title: level1FilterTitle, parentId: filterLevel0.id, level: 1, parentTitle: filterLevel0.title, kind: kindId, categoryId: currentCategory.id)
                    filterLevel1.volume = .v_075
                    filters.append(filterLevel1)
                    
                    
                    if filterCategory.getLevel2(by: level0FilterIndex, by: level1FilterIndex).count == 0 {
                        
                        let random = Int.random(in: 1 ..< maxProducts)
                        
                        for _ in 0...random {
                            let product = createProduct(
                                name: productNameENG + " #\(productId)",
                                nameRU: productNameRU + " #\(productId)",
                                categoryId: currentCategory.id,
                                filterId: filterLevel0.id,
                                pointEnum: pointEnum,
                                menuMapEnum: .classic,
                                volume: "0.75",
                                color: color,
                                sugar: getSugar())
                            addAttribute(product: product, filterId: filterLevel1.id, attrName: level0FilterTitle, attrValue: level1FilterTitle)
                            addCountry(product: product, country: level1FilterTitle)
                            products.append(product)
                        }
                    }
                    
                    filterId += 1
                    
                    
                    
                    for (_, level2FilterTitle) in filterCategory.getLevel2(by: level0FilterIndex, by: level1FilterIndex).enumerated() {
                        let filterLevel2 = Filter(id: filterId, pointEnum: pointEnum, menuMapEnum: .classic, title: level2FilterTitle, parentId: filterLevel1.id, level: 2, parentTitle: filterLevel1.title, kind: kindId, categoryId: currentCategory.id)
                        filterLevel2.volume = .v_075
                        filters.append(filterLevel2)
                        
                        let random = Int.random(in: 1 ..< maxProducts)
                        
                        for _ in 0...random {
                            let product = createProduct(
                                name: productNameENG + " #\(productId)",
                                nameRU: productNameRU + " #\(productId)",
                                categoryId: currentCategory.id,
                                filterId: filterLevel0.id,
                                pointEnum: pointEnum,
                                menuMapEnum: .classic,
                                volume: "0.75",
                                color: color,
                                sugar: getSugar())
                            
                            
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
            let priceFilters = filters.filter{$0.parentId == rootFilterId && $0.menuMapEnum == .price}
            
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
                               nameRU: String,
                               categoryId: Int,
                               filterId: Int,
                               pointEnum: PointEnum,
                               menuMapEnum: MenuMapEnum,
                               volume: String,
                               color: ProductColorEnum,
                               sugar: ProductSugarEnum
    ) -> Product {
        
        let popularity = Int.random(in: 0 ..< 100)
        let year = Int.random(in: 1985 ..< 2019)
        let price = Int.random(in: 250 ..< 20000)
        let oldPrice = Int.random(in: 250 ..< 20000)
        
        
        let from = Int.random(in: 0 ..< grapes.count - 5)
        let to = Int.random(in: from ..< from+5)
        
        var tmp = ""
        for i in from...to {
            tmp += "\(grapes[i]),"
        }
        
        let realString = String(tmp.dropLast())
        
        var colURL = ""
        switch color {
        case .pink:
            colURL = "http://185.219.42.85:3000/Images/pink.png"
        case .red:
            colURL = "http://185.219.42.85:3000/Images/red2.png"
        case .white:
            colURL = "http://185.219.42.85:3000/Images/white2.png"
        default:
            break
        }
        
        let product = Product(id: productId,
                              name: name,
                              pointEnum: pointEnum,
                              menuMapEnum: menuMapEnum,
                              categoryId: categoryId,
                              desc: "",
                              price: Double(price),
                              attributeIds: [filterId],
                              imageURL: colURL,
                              manufactureYear: year,
                              nameRU: nameRU,
                              volume: volume,
                              grapes: realString,
                              color: color,
                              country: "",
                              countryIconURL: "",
                              sugar: sugar
        )
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
    
    
    private func addCountry(product: Product, country: String) {
        product.country = country
        
        if let iconURL = iconByCountries[country] {
            product.countryIconURL = iconURL
        }
    }
    
    private func getSugar() -> ProductSugarEnum {
        let sugar:[ProductSugarEnum] = [.dry, .semidry, .semisweet, .sweet]
        let s = Int.random(in: 0 ..< sugar.count)
        
        return sugar[s]
    }
    
    
    let grapes:[String] = ["Айрен","Алиберне (одесский черный)","Алиготе","Аликанте","Альбариньо","Альянико","Амарал","Ансоника (инзолия)","Аринто","Арнеис","Асал","Барбера","Бастардо магарачский","Белые сорта винограда","Блауфренкиш","Боваледду","Бонарда","Боррасал","Бурбуленк","Буше (каберне фран)","Бьянколлела","Верделло","Вердехо","Вердиккио","Верментино","Весполина","Виньяо","Виозиньо","Вионье","Витовска","Виура","Гальоппо","Гаме","Гарганега","Гарнача","Гевюрцтраминер","Годельо","Грасиано","Греканико","Грекетто","Греко","Греко неро","Гренаш","Гренаш блан","Грилло","Гро мансенг","Грюнер вельтлинер","Джинестра","Дзибиббо (мускат александрийский)","Дольчетто","Другие сорта","Зинфандель","Инзолия (ансоника)","Каберло","Каберне совиньон","Каберне фран","Канайоло","Кариньян","Кариньяно","Карменер","Катарратто","Кахури мцване","Киси","Клерет","Кодега","Коломбар","Колорино","Корвина веронезе","Корвиноне","Кортезе","Красностоп","Красные сорта винограда","Кроатина","Лагрейн","Лаурейро","Лозе","Лоурейро","Мальбек","Мальвазия","Мальвазия бьянка","Мальвазия истриана","Мальвазия нера","Мальвазия фина","Марсан","Марселан","Масуэло","Матаро","Менсия","Мерло","Молинара","Монастрель","Мондёс","Моника","Монтепульчано","Москатель","Москатель де грано менудо","Мурведр","Мускат","Мускат гамбургский","Мускат желтый","Мускат люнель","Мюллер тургау","Мюскаде (мелон де бургонь)","Мюскадель","Мюскарден","Неббиоло","Негретт","Негроамаро","Нерелло маскалезе","Неро д'авола","Нурагус","Озелета","Палава","Паломино","Пассерина","Педерна","Педро хименес","Пекорелло","Пекорино","Перриконе","Пигато","Пикпуль","Пино блан","Пино бьянко","Пиногри","Пино гриджо","Пино неро","Пино нуар","Пинотаж","Примитиво","Пти вердо","Пти сира","Птит сира","Пуньителло","Пьедироссо","Рабигато","Рабозо","Рефоско","Риболла джалла","Риполи","Рислинг","Рислинг итальянский","Рислинг рейнский","Ркацители","Ролль (верментино)","Рондинелла","Россезе","Руссан","Санджовезе","Санкт лаурент","Саперави","Семильон","Сенсо","Сильванер","Сира","Совиньон блан","Совиньон гри","Соусон","Танна","Темпранильо","Терольдего","Тибурен","Тиморассо","Тинта амарела","Тинта баррока","Тинта веласко","Тинта као","Тинта рориш","Тинто фино (темпранильо)","Токай","Торронтес","Траминер","Треббьяно","Треббьяно д'абруццо","Треббьяно ди лугана","Треббьяно тоскано (проканико)","Трейшадура","Турига насьонал","Турига франка","Фалангина","Фамозо","Фениле","Фер серваду","Фиано","Фурминт","Харшлевелю","Цвайгельт","Чарелло","Шардоне","Шенен блан","Шираз","Шпетбургундер (пино нуар)"]
    
    
    
    func encode(response: Response){
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            if let data = try? encoder.encode(response) {
                print(String(data: data, encoding: .utf8)!)
            }
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
}
