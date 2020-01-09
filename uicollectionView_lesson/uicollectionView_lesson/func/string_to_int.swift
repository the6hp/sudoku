import Foundation

func string_to_int_all (array: [String]) -> [Int] {
var res = [Int]()
    let arrayCount = array.count
var i = 0
    repeat {
        let a = Int(array[i]) ?? 0
        res.append(a)
        i += 1
    } while i < arrayCount
return res
}
