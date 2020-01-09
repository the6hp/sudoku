var allNumbers = [1,2,3,4,5,6,7,8,9,4,5,6,7,8,9,1,2,3,7,8,9,1,2,3,4,5,6,2,3,4,5,6,7,8,9,1,5,6,7,8,9,1,2,3,4,8,9,1,2,3,4,5,6,7,3,4,5,6,7,8,9,1,2,6,7,8,9,1,2,3,4,5,9,1,2,3,4,5,6,7,8]

var allNumbers_text = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "4", "5", "6", "7", "8", "9", "1", "2", "3", "7", "8", "9", "1", "2", "3", "4", "5", "6", "2", "3", "4", "5", "6", "7", "8", "9", "1", "5", "6", "7", "8", "9", "1", "2", "3", "4", "8", "9", "1", "2", "3", "4", "5", "6", "7", "3", "4", "5", "6", "7", "8", "9", "1", "2", "6", "7", "8", "9", "1", "2", "3", "4", "5", "9", "1", "2", "3", "4", "5", "6", "7", "8"]


func int_to_string (array: [Int]) -> [String] {
    var res = [String]()
    var arrayCount = array.count
    var i = 0
    
    repeat {
        var a = String(array[i])
        res.append(a)
        i += 1
    } while i < arrayCount
    return res
}

int_to_string(array: allNumbers)



func string_to_int (array: [String]) -> [Int] {
    var res = [Int]()
    var arrayCount = array.count
    var i = 0
        repeat {
            var a = Int(array[i]) ?? 0
            res.append(a)
            i += 1
        } while i < arrayCount
        return res
    }

string_to_int(array: allNumbers_text)
