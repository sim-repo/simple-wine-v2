import Foundation



extension Sequence {

    func group<T:Comparable>(by:KeyPath<Element,T>) -> [(key:T,values:[Element])]{

        return self.reduce([]){(accumulator, element) in

            var accumulator = accumulator
            var result :(key:T,values:[Element]) = accumulator.first(where:{ $0.key == element[keyPath:by]}) ?? (key: element[keyPath:by], values:[])
            result.values.append(element)
            if let index = accumulator.index(where: { $0.key == element[keyPath: by]}){
                accumulator.remove(at: index)
            }
            accumulator.append(result)

            return accumulator
        }
    }
}
