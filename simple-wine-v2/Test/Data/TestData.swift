import Foundation

class TestData {
    
    private init(){}
    static var shared = TestData()
    
    var categories: [Category] = getCategories()
    var products: [Product] = []
    var filters: [Filter] = []
    var productId = 0
    var filterId = 0
    var kindId = 0
    
    
    // point independed
    static func getCategories() -> [Category] {
        return [
            Category(id: 0, title: "Игристое", imageURL: "logo-wines2"),
            Category(id: 1, title: "Шампанское",  imageURL: "shampane-logo"),
            Category(id: 2, title: "Вино",  imageURL: "drink-logo"),
            Category(id: 3, title: "Десертное",  imageURL: "Set-Logo"),
            Category(id: 4, title: "Half-Bottle",  imageURL: "juice"),
            Category(id: 5, title: "Magnum",  imageURL: "juice")
        ]
    }
    
    
    func start() {
        createFilter(pointEnum: .grandcru)
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
    
    
    
    
    struct RootFilters {
        //level 0
        let names = ["Цвет","Страна","Цена","Сахар","Сорт Винограда","Объем","Производитель"] // category id == 2
        
        
        //level 1
        let colors: [Int:[String]] = [0:["Белое","Красное","Розовое"]]
        
        
        let countries: [Int:[String]] = [1:["Италия", "Франция", "Испания","Австралия","Австрия","Аргентина","Венгрия","Германия","Чили"]]
        
        
        let prices: [Int:[String]] = [2:["до 1 500 ₽", "от 1 500 до 3 000 ₽", "от 3 000 до 5 000 ₽", "от 10 000 ₽"]]
        
        let sugar: [Int:[String]] = [3:["Сухое","Полусухое","Полусладкое","Сладкое"]]
        let grapes: [Int:[String]] = [4:["Айрен","Алиберне (одесский черный)","Алиготе","Аликанте","Альбариньо","Альянико","Амарал","Ансоника (инзолия)","Аринто","Арнеис","Асал","Барбера","Бастардо магарачский","Белые сорта винограда","Блауфренкиш","Боваледду","Бонарда","Боррасал","Бурбуленк","Буше (каберне фран)","Бьянколлела","Верделло","Вердехо","Вердиккио","Верментино","Весполина","Виньяо","Виозиньо","Вионье","Витовска","Виура","Гальоппо","Гаме","Гарганега","Гарнача","Гевюрцтраминер","Годельо","Грасиано","Греканико","Грекетто","Греко","Греко неро","Гренаш","Гренаш блан","Грилло","Гро мансенг","Грюнер вельтлинер","Джинестра","Дзибиббо (мускат александрийский)","Дольчетто","Другие сорта","Зинфандель","Инзолия (ансоника)","Каберло","Каберне совиньон","Каберне фран","Канайоло","Кариньян","Кариньяно","Карменер","Катарратто","Кахури мцване","Киси","Клерет","Кодега","Коломбар","Колорино","Корвина веронезе","Корвиноне","Кортезе","Красностоп","Красные сорта винограда","Кроатина","Лагрейн","Лаурейро","Лозе","Лоурейро","Мальбек","Мальвазия","Мальвазия бьянка","Мальвазия истриана","Мальвазия нера","Мальвазия фина","Марсан","Марселан","Масуэло","Матаро","Менсия","Мерло","Молинара","Монастрель","Мондёс","Моника","Монтепульчано","Москатель","Москатель де грано менудо","Мурведр","Мускат","Мускат гамбургский","Мускат желтый","Мускат люнель","Мюллер тургау","Мюскаде (мелон де бургонь)","Мюскадель","Мюскарден","Неббиоло","Негретт","Негроамаро","Нерелло маскалезе","Неро д'авола","Нурагус","Озелета","Палава","Паломино","Пассерина","Педерна","Педро хименес","Пекорелло","Пекорино","Перриконе","Пигато","Пикпуль","Пино блан","Пино бьянко","Пиногри","Пино гриджо","Пино неро","Пино нуар","Пинотаж","Примитиво","Пти вердо","Пти сира","Птит сира","Пуньителло","Пьедироссо","Рабигато","Рабозо","Рефоско","Риболла джалла","Риполи","Рислинг","Рислинг итальянский","Рислинг рейнский","Ркацители","Ролль (верментино)","Рондинелла","Россезе","Руссан","Санджовезе","Санкт лаурент","Саперави","Семильон","Сенсо","Сильванер","Сира","Совиньон блан","Совиньон гри","Соусон","Танна","Темпранильо","Терольдего","Тибурен","Тиморассо","Тинта амарела","Тинта баррока","Тинта веласко","Тинта као","Тинта рориш","Тинто фино (темпранильо)","Токай","Торронтес","Траминер","Треббьяно","Треббьяно д'абруццо","Треббьяно ди лугана","Треббьяно тоскано (проканико)","Трейшадура","Турига насьонал","Турига франка","Фалангина","Фамозо","Фениле","Фер серваду","Фиано","Фурминт","Харшлевелю","Цвайгельт","Чарелло","Шардоне","Шенен блан","Шираз","Шпетбургундер (пино нуар)"]]
        
        let volumes: [Int:[String]] = [5:["0.187","0.2","0.375","0.5","0.7","0.73","0.75","1.5","6"]]
        let manufacture: [Int:[String]] = [6:["Cantine Marisa Cuomo", "Capannelle", "Campo Delia", "Achaval-Ferrer","Adega Cooperativa da Vermelha","Adegas Gran Vinum","Advini","Agricola Punica","Agricola Requingua Limitada","Agricola San Felice","Alain Gras","Albali","Alvaro Palacios"
            ,"Amatore","Bertani","Besini","Bio Bio","Bodega Chacra","Bodegas Alion","Bodegas Cepa 21","Bodegas Chivite","Bodegas Faustino","Bodegas Hermanos Sastre"
            ,"Bodegas Horacio Gomez Araujo","Bodegas Leganza","Bodegas Manzanos","Bodegas Monasterio","Bodegas Palacios Remondo","Bodegas Valparaiso","Bodegas Vega Sicilia","Bodegas y Vinedos Alnardo"
            ,"Boisset","Bonneau du Martray","Bonny Doon Vineyards","Bordeaux De Citran","Bouchard Pere & Fils","Braida","Brancaia","Bruno Giacosa","Byrne Vineyards","Ca'Del Bosco","Caliterra"]]
        
        //level 2
        let region: [Int:[String]] = [0:["Пьемонт","Лацио","Абруццо"],  1:["Долина Луары","Бургундия","Аквитания"],  2:["Валенсия","Ла Манча","Риоха"],
                                      3:["Новый Южный Уэльс","Тасмания","Виктория"],4:["Бергланд","Бургенланд","Карнунтум","Кампталь","Кремшталь","Штирия"],
                                      5:["долина Мендоса","Сан-Хуан","провинции Ла-Риоха","Сальта","Рио-Негро"], 6:["долина Мендоса","Сан-Хуан","провинции Ла-Риоха","Сальта","Рио-Негро"],
                                      7:["Чонград","Сан-Хуан","Хайош-Бая","Куншаг"], 8:["Аар", "Баден", "Вюртемберг", "Гессише Бергштрассе", "Зале-Унштрут", "Миттельрейн" ],
                                      9:["Аконкагуа", "Долина Касабланка", "Долина Сан Антонио", "Долина Лимари", "Центральная Долина", "Долина Колчагуа", "Долина Майпо"]
        ]
    }
    
    
    private func createFilter(pointEnum: PointEnum) {
        
        let root = RootFilters()
        
        
        for category in categories {
            
            kindId += 1
            
            let filter = Filter(id: filterId, pointEnum: pointEnum, title: "Цвет", parentId: nil, level: 0, parentTitle: nil, kind: kindId, categoryId: category.id)
            filters.append(filter)
            filterId += 1
            for _ in 0...300 {
                let product = createProduct(name: category.title + " #\(productId)",
                    categoryId: category.id,
                    filterId: filter.id,
                    pointEnum: .grandcru)
                products.append(product)
            }
            createSubFilters(parentfilter: filter, root: root.colors, useSubSubFilter: false)
            
            
            // names
            
            for (row, name) in root.names.enumerated() {
                if row == 0 {
                    continue
                }
                
                kindId += 1
                
                let filter = Filter(id: filterId, pointEnum: pointEnum, title: name, parentId: nil, level: 0, parentTitle: nil, kind: kindId, categoryId: category.id)
                filters.append(filter)
                filterId += 1
                
                var useSubSubFilter = false
                var attributes: [Int : [String]] = [:]
                var subAttributes: [Int : [String]] = [:]
                
                switch row {
                case 1:
                    attributes = root.countries
                    useSubSubFilter = true
                    subAttributes = root.region
                case 2:
                    attributes = root.prices
                case 3:
                    attributes = root.sugar
                case 4:
                    attributes = root.grapes
                case 5:
                    attributes = root.volumes
                case 6:
                    attributes = root.manufacture
                default:
                    break
                }
                createSubFilters(parentfilter: filter, root: attributes, useSubSubFilter: useSubSubFilter, subroot: subAttributes)
            }
            
            
        }
        
    }
    
    
    
    
    private func createSubFilters(parentfilter: Filter, root: [Int : [String]], useSubSubFilter: Bool, subroot:[Int : [String]]? = nil ){
        var currentFilters: [Filter] = []
        var root_index_By_Filter: [Int:Int] = [:]
        
        for dict in root {
            for (row,val) in dict.value.enumerated() {
                let filter = Filter(id: filterId, pointEnum: parentfilter.pointEnum, title: val, parentId: parentfilter.id, level: parentfilter.level+1, parentTitle: parentfilter.title, kind: kindId, categoryId: parentfilter.categoryId)
                root_index_By_Filter[filter.id] = row
                filters.append(filter)
                currentFilters.append(filter)
                filterId += 1
            }
        }
        
        for product in products.filter({$0.categoryId == parentfilter.categoryId  }) {
            let idx = Int.random(in: 0 ..< currentFilters.count )
            addAttribute(product: product, filterId: currentFilters[idx].id, attrName: parentfilter.title, attrValue: currentFilters[idx].title)
        }
        
        if useSubSubFilter {
            for f in currentFilters {
                let idx = root_index_By_Filter[f.id]!
                guard let subr = subroot else { return }
                createSubSubFilter(parentfilter: f, rootIdx: idx, sub: subr)
            }
        }
    }
    
    private func createSubSubFilter(parentfilter: Filter, rootIdx: Int, sub: [Int : [String]]) {
        var currentFilters: [Filter] = []
        let values = sub[rootIdx]!
        
        for val in values {
            let filter = Filter(id: filterId, pointEnum: parentfilter.pointEnum, title: val, parentId: parentfilter.id, level: parentfilter.level+1, parentTitle: parentfilter.title, kind: kindId, categoryId: parentfilter.categoryId)
            filters.append(filter)
            currentFilters.append(filter)
            filterId += 1
        }
        
        
        for product in products.filter({$0.categoryId == parentfilter.categoryId && $0.attributeIds.contains(parentfilter.id)}) {
            let idx = Int.random(in: 0 ..< currentFilters.count )
            addAttribute(product: product, filterId: currentFilters[idx].id, attrName: "Регион", attrValue: currentFilters[idx].title)
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
            product.desc += "\n\(attrName): \(attrValue)"
        }

        

    }
    
}
