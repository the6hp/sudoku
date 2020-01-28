import Foundation

func new_remove_all (array: [Int], difficulty: Int) -> [String] {
    
    mainArray.endArray = array
    
    var max_item = 0
    
    var res_array = [String]()
        var i = 0
        repeat {
            var a = String(array[i])
            res_array.append(a)
            i += 1
        } while i < array.count
    
    
    switch difficulty {
    case 0:
        max_item = Int.random(in: 46..<51)
    case 1:
        max_item = Int.random(in: 51..<56)
    case 2:
        max_item = Int.random(in: 56..<61)
    case 3:
        max_item = Int.random(in: 61..<66)
    default:
        break
    }
    
    var item = 0
    repeat {
        var item_deleting = Int.random(in: 0..<81)
        if res_array[item_deleting] != "" {
            res_array[item_deleting] = ""
            item += 1
        }
    } while item < max_item

    
    

    return res_array
}
