import Foundation

func hide_used_numbers_all (num: String) -> Int {
    var res = 0
    
    if settings.hideUsedNumbers == true {
        var a = 0
        var i = 0
        repeat {
            if mainArray.testArray[i][0] == num {
                a += 1
            }
            i += 1
        } while i < 81
        if a >= 9 {
            res = 1
        }
    }
   
    
    return res
}
