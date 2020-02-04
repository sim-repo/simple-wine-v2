import Foundation


struct TestParse {
    
    func encode(){
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            if let data = try? encoder.encode(Response.single()) {
                print(String(data: data, encoding: .utf8)!)
            }
        } catch (let err) {
            print(err.localizedDescription)
        }
    }
    
    
    func decode(){
        guard let path = Bundle.main.path(forResource: "Test", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let response: Response = try JSONDecoder().decode(Response.self, from: data)
            for point in response.points {
                print(point.name)
            }
            print("---------------------------------------------------------")
            for category in response.categories {
                print(category.title)
            }
            print("---------------------------------------------------------")
            for filter in response.filters {
                print(filter.title)
            }
            print("---------------------------------------------------------")
            for product in response.products{
                print(product.name)
            }
            print("---------------------------------------------------------")
            for setting in response.detailMapSetting{
                print(setting.categoryId)
            }
        } catch DecodingError.dataCorrupted(let context) {
            print(DecodingError.dataCorrupted(context))
        } catch DecodingError.keyNotFound(let key, let context) {
            print(DecodingError.keyNotFound(key,context))
        } catch DecodingError.typeMismatch(let type, let context) {
            print(DecodingError.typeMismatch(type,context))
        } catch DecodingError.valueNotFound(let value, let context) {
            print(DecodingError.valueNotFound(value,context))
        } catch let error{
            print(error)
        }
    }
    
}
