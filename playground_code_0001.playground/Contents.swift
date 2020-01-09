var allNumbers_text = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "4", "5", "6", "7", "8", "9", "1", "2", "3", "7", "8", "9", "1", "2", "3", "4", "5", "6", "2", "3", "4", "5", "6", "7", "8", "9", "1", "5", "6", "7", "8", "9", "1", "2", "3", "4", "8", "9", "1", "2", "3", "4", "5", "6", "7", "3", "4", "5", "6", "7", "8", "9", "1", "", "6", "7", "8", "9", "1", "2", "3", "4", "5", "9", "1", "2", "3", "4", "5", "6", "7", "8"]


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


check_array_on_null_all(array: allNumbers_text)


func test () -> Bool {
    var testN:Bool = true
    
    if check_array_on_null_all(array: allNumbers_text) == true {
        print("true")
    } else {
        print("false")
    }
    
    
    return testN
}

test()
