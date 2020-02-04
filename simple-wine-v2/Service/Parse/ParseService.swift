import Foundation


class ParseService {
    
    static func decodeAll(data: Data) -> Response? {
        do {
            let response: Response = try JSONDecoder().decode(Response.self, from: data)
            return response
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
        return nil
    }
    
    static func decodePoints(data: Data) -> [Point]? {
        do {
            let dictionary: [String:[Point]] = try JSONDecoder().decode([String:[Point]].self, from: data)
            let points = dictionary.flatMap{$0.value}
            return points
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
        return nil
    }

}
