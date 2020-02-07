import Foundation
import RealmSwift

class RealmService {
    
    
    
    //MARK:- public >>
    
    //MARK:- Load
    public static func loadPoints() -> [Point]? {
        guard let realm = getInstance(.unsafe) else { return nil }
        let objects: Results<RealmPoint> = realm.objects(RealmPoint.self)
        let points = realmToPoints(objects)
        return points
    }
    
    
    public static func loadCategories() -> [Category]? {
        guard let realm = getInstance(.unsafe) else { return nil }
        let objects: Results<RealmCategory> = realm.objects(RealmCategory.self)
        let categories = realmToCategories(objects)
        return categories
    }
    
    
    public static func loadFilters() -> [Filter]? {
        guard let realm = getInstance(.unsafe) else { return nil }
        let objects: Results<RealmFilter> = realm.objects(RealmFilter.self)
        let filters = realmToFilters(objects)
        return filters
    }
    
    
    public static func loadProducts() -> [Product]? {
        guard let realm = getInstance(.unsafe) else { return nil }
        let objects: Results<RealmProduct> = realm.objects(RealmProduct.self)
        let products = realmToProducts(objects)
        return products
    }
    
    
    public static func loadDetailMapSettings() -> [DetailMapSetting]? {
        guard let realm = getInstance(.unsafe) else { return nil }
        let objects: Results<RealmDetailMapSetting> = realm.objects(RealmDetailMapSetting.self)
        let settings = realmToDetailMapSetting(objects)
        return settings
    }
    
    
    
    
    public static func save(models: [PersistableModel], update: Bool) {
        
        guard let element = models.first else { return }
        
        switch element.self {
        case is Point:
            let points = models as! [Point]
            pointsToRealm(points)
        case is Category:
            let categories = models as! [Category]
            categoriesToRealm(categories)
        case is Filter:
            let filters = models as! [Filter]
            filtersToRealm(filters)
        case is Product:
            let products = models as! [Product]
            productsToRealm(products)
        case is DetailMapSetting:
            let settings = models as! [DetailMapSetting]
            detailMapSettingToRealm(settings)
        default:
            log("save(models:): no case for \(element.self)", level: .warning)
        }
    }
    
    
    //MARK:- Save
    
    
    private static func pointsToRealm(_ points: [Point]) {
        var objects: [Object] = []
        
        for (row, point) in points.enumerated() {
            let realmPoint = RealmPoint()
            realmPoint.id = row
            realmPoint.pointId = point.id.rawValue
            realmPoint.name = point.name
            realmPoint.logoOnLightImageURL = point.logoOnLightImageURL
            objects.append(realmPoint)
        }
        save(items: objects, update: true)
    }
    
    
    private static func categoriesToRealm(_ categories: [Category]) {
        var objects: [Object] = []
        
        for category in categories {
            let realmCategory = RealmCategory()
            realmCategory.id = category.id
            realmCategory.title = category.title
            realmCategory.imageURL = category.imageURL
            objects.append(realmCategory)
        }
        save(items: objects, update: true)
    }
    
    
    private static func filtersToRealm(_ filters: [Filter]) {
        var objects: [Object] = []
        
        for filter in filters {
            let realmFilter = RealmFilter()
            realmFilter.id = filter.id
            realmFilter.title = filter.title
            realmFilter.parentId.value = filter.parentId
            realmFilter.pointEnum = filter.pointEnum.rawValue
            realmFilter.kindId = filter.kindId
            realmFilter.categoryId = filter.categoryId
            realmFilter.level = filter.level
            realmFilter.parentTitle = filter.parentTitle ?? ""
            objects.append(realmFilter)
        }
        save(items: objects, update: true)
    }
    
    
    private static func productsToRealm(_ products: [Product]) {
        var objects: [Object] = []
        
        for product in products {
            let realmProduct = RealmProduct()
            realmProduct.id = product.id
            realmProduct.name = product.name
            realmProduct.categoryId = product.categoryId
            realmProduct.pointEnum = product.pointEnum.rawValue
            realmProduct.desc = product.desc
            realmProduct.bigDesc = product.bigDesc
            realmProduct.price = product.price
            realmProduct.oldPrice = product.oldPrice
            realmProduct.popularity = product.popularity
            realmProduct.attributeIds.append(objectsIn: product.attributeIds)
            realmProduct.imageURL = product.imageURL
            realmProduct.manufactureYear = product.manufactureYear
            realmProduct.isLiked = product.isLiked
            objects.append(realmProduct)
        }
        save(items: objects, update: true)
    }
    
    
    private static func detailMapSettingToRealm(_ detailMapSettings: [DetailMapSetting]) {
        var objects: [Object] = []
        
        for setting in detailMapSettings {
            let realmSetting = RealmDetailMapSetting()
            realmSetting.id = setting.categoryId
            realmSetting.kindIds.append(objectsIn: setting.kindIds)
            realmSetting.prefix.append(objectsIn: setting.prefix)
            let icons = setting.icons.compactMap{$0}
            realmSetting.icons.append(objectsIn: icons)
            objects.append(realmSetting)
        }
        save(items: objects, update: true)
    }
    
    
    
    static func clearAll(confEnum: RealmConfigEnum) {
        let realm = getInstance(confEnum)
        do {
            try realm?.write {
                realm?.deleteAll()
            }
        } catch(let err) {
            Logger.catchError(msg: err.localizedDescription)
        }
    }
    
    
    enum RealmConfigEnum {
        
        case unsafe
        case safe
        
        private static let safeConfig = Realm.Configuration (
            fileURL: getRealmURL(dbName: "safe"),
            encryptionKey: getKey() as Data,
            deleteRealmIfMigrationNeeded: true
        )
        
        private static let mainConfig = Realm.Configuration (
            fileURL:  getRealmURL(dbName: "main"),
            deleteRealmIfMigrationNeeded: true
        )
        
        var config: Realm.Configuration {
            switch self {
            case .safe:
                return RealmConfigEnum.safeConfig
            default:
                return RealmConfigEnum.mainConfig
            }
        }
    }
    
    
    
    //MARK:- private >>>
    
    
    
    private static func realmToPoints(_ objects: Results<RealmPoint>) -> [Point]? {
        var points = [Point]()
        if objects.isEmpty {
            return nil
        }
        for obj in objects {
            let id = obj.pointId
            let name = obj.name
            let logoOnLightImageURL = obj.logoOnLightImageURL
            let pointEnum: PointEnum = PointEnum.init(rawValue: id) ?? .unknown
            let point = Point(id: pointEnum, name: name, logoOnLightImageURL: logoOnLightImageURL)
            points.append(point)
        }
        return points
    }
    
    
    private static func realmToCategories(_ objects: Results<RealmCategory>) -> [Category]? {
        var categories = [Category]()
        if objects.isEmpty {
            return nil
        }
        for obj in objects {
            let id = obj.id
            let title = obj.title
            let imageURL = obj.imageURL
            let category = Category(id: id, title: title, imageURL: imageURL)
            categories.append(category)
        }
        return categories
    }
    
    
    private static func realmToFilters(_ objects: Results<RealmFilter>) -> [Filter]? {
        var filters = [Filter]()
        if objects.isEmpty {
            return nil
        }
        for obj in objects {
            let id = obj.id
            let title = obj.title
            let parentId = obj.parentId.value
            let categoryId = obj.categoryId
            let pointEnum: PointEnum = PointEnum.init(rawValue: obj.pointEnum) ?? .unknown
            let kindId = obj.kindId
            let level = obj.level
            let parentTitle = obj.parentTitle
            
            let filter = Filter(id: id,
                                pointEnum: pointEnum,
                                title: title,
                                parentId: parentId,
                                level: level,
                                parentTitle: parentTitle,
                                kind: kindId,
                                categoryId: categoryId)
            filters.append(filter)
        }
        return filters
    }
    
    
    private static func realmToProducts(_ objects: Results<RealmProduct>) -> [Product]? {
        var products = [Product]()
        if objects.isEmpty {
            return nil
        }
        for obj in objects {
            let id = obj.id
            let name = obj.name
            let categoryId = obj.categoryId
            let pointEnum: PointEnum = PointEnum.init(rawValue: obj.pointEnum) ?? .unknown
            let desc = obj.desc
            let bigDesc = obj.bigDesc
            let price = obj.price
            let oldPrice = obj.oldPrice
            let popularity = obj.popularity
            let attributeIds = Array(obj.attributeIds)
            let imageURL = obj.imageURL
            let manufactureYear = obj.manufactureYear
            let isLiked = obj.isLiked
            
            let product = Product(id: id,
                                  name: name,
                                  pointEnum: pointEnum,
                                  categoryId: categoryId,
                                  desc: desc,
                                  price: price,
                                  oldPrice: oldPrice,
                                  attributeIds: attributeIds,
                                  imageURL: imageURL,
                                  popularity: popularity,
                                  manufactureYear: manufactureYear)
            product.bigDesc = bigDesc
            product.isLiked = isLiked
            products.append(product)
        }
        return products
    }
    
    
    
    private static func realmToDetailMapSetting(_ objects: Results<RealmDetailMapSetting>) -> [DetailMapSetting]? {
        var settings = [DetailMapSetting]()
        if objects.isEmpty {
            return nil
        }
        
        for obj in objects {
            
            let categoryId = obj.categoryId
            let kindIds = Array(obj.kindIds)
            let prefix = Array(obj.prefix)
            let icons = Array(obj.icons)
            
            let setting = DetailMapSetting(categoryId: categoryId,
                                           kindIds: kindIds,
                                           prefix: prefix,
                                           icons: icons)
            settings.append(setting)
        }
        return settings
    }
    
    
    
    private static func save<T: Object>(items: [T], update: Bool) {
        let realm = getInstance(.unsafe)
        do {
            try realm?.write {
                if update {
                    realm?.add(items, update: .all)
                } else {
                    realm?.add(items)
                }
            }
        } catch(let err) {
            Logger.catchError(msg: err.localizedDescription)
        }
    }
    
    
    
    
    private  static func getRealmURL(dbName: String) -> URL {
        let documentDirectory = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask,
                                                             appropriateFor: nil, create: false)
        return documentDirectory.appendingPathComponent("\(dbName).realm")
    }
    
    
    
    private static func getInstance(_ confEnum: RealmConfigEnum) -> Realm? {
        do {
            let realm = try Realm(configuration: confEnum.config)
            Logger.console(msg: "Realm DB Path: \(realm.configuration.fileURL?.absoluteString ?? "")", printEnum: .realm)
            return realm
        } catch(let err) {
            Logger.catchError(msg: err.localizedDescription)
        }
        return nil
    }
    
    
    
    private static func getKey() -> NSData {
        let keychainIdentifier = "io.Realm.EncryptionKey"
        let keychainIdentifierData = keychainIdentifier.data(using: String.Encoding.utf8, allowLossyConversion: false)!
        
        var query: [NSString: AnyObject] = [
            kSecClass: kSecClassKey,
            kSecAttrApplicationTag: keychainIdentifierData as AnyObject,
            kSecAttrKeySizeInBits: 512 as AnyObject,
            kSecReturnData: true as AnyObject
        ]
        
        var dataTypeRef: AnyObject?
        var status = withUnsafeMutablePointer(to: &dataTypeRef) { SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0)) }
        if status == errSecSuccess {
            return dataTypeRef as! NSData
        }
        
        let keyData = NSMutableData(length: 64)!
        let result = SecRandomCopyBytes(kSecRandomDefault, 64, keyData.mutableBytes.bindMemory(to: UInt8.self, capacity: 64))
        assert(result == 0, "Failed to get random bytes")
        
        query = [
            kSecClass: kSecClassKey,
            kSecAttrApplicationTag: keychainIdentifierData as AnyObject,
            kSecAttrKeySizeInBits: 512 as AnyObject,
            kSecValueData: keyData
        ]
        
        status = SecItemAdd(query as CFDictionary, nil)
        assert(status == errSecSuccess, "Failed to insert the new key in the keychain")
        
        return keyData
    }
    
    
    private static func log(_ msg: String, level: Logger.LogLevelEnum) {
        Logger.log(clazz: "RealmService", msg, level: level, printEnum: .realm)
    }
}
