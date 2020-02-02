import Foundation

func fill_array_all () {
    let a = mainArray.allNumbers_text
    var i = 0

    repeat {
        mainArray.testArray[i][0] = mainArray.allNumbers_text[i]
        i += 1
    } while i < a.count
}




