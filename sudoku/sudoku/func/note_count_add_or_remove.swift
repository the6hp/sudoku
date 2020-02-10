import Foundation

func note_count_add_or_remove () {
    var i = 0
    
    repeat {
        if mainArray.testArray[i][4] == "" && mainArray.testArray[i][5] == "" && mainArray.testArray[i][6] == "" && mainArray.testArray[i][7] == "" && mainArray.testArray[i][8] == "" && mainArray.testArray[i][9] == "" && mainArray.testArray[i][10] == "" && mainArray.testArray[i][11] == "" && mainArray.testArray[i][12] == "" {
            mainArray.testArray[i][3] = "0"
        } else {
            mainArray.testArray[i][3] = "1"
        }
        i += 1
    } while i < 81

}
