import Foundation


class ParseService {
    
    static func decodeAll(data: Data, _ onError: setterOnError) -> Response? {
        do {
            let response: Response = try JSONDecoder().decode(Response.self, from: data)
            return response
        } catch DecodingError.dataCorrupted(let context) {
            onError?("ParseService: DecodingError.dataCorrupted: \(DecodingError.dataCorrupted(context))")
        } catch DecodingError.keyNotFound(let key, let context) {
            onError?("ParseService: DecodingError.keyNotFound: \(DecodingError.keyNotFound(key,context))")
        } catch DecodingError.typeMismatch(let type, let context) {
            onError?("ParseService: DecodingError.typeMismatch: \(DecodingError.typeMismatch(type,context))")
        } catch DecodingError.valueNotFound(let value, let context) {
            onError?("ParseService: DecodingError.typeMismatch: \(DecodingError.valueNotFound(value,context))")
        } catch let error {
            onError?("ParseService: \(error.localizedDescription)")
        }
        return nil
    }
}
