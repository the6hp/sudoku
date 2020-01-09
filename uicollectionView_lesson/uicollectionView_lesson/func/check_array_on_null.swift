import Foundation

func check_array_on_null_all (array: [String]) -> Bool {
    var res:Bool = true
    var i: Int = 0
    repeat {
        if array[i] == "" {
            res = false
            break
        }
        i += 1
    } while i <= 80
    return res
}
