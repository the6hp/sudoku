import Foundation

func int_to_string (array: [Int]) -> [String] {
    var res = [String]()
    let arrayCount = array.count
    var i = 0
    repeat {
        let a = String(array[i])
        res.append(a)
        i += 1
    } while i < arrayCount
return res
}
