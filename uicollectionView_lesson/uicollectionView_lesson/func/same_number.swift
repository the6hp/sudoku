import Foundation

func same_number_all() {
    var number = variables.selectCell![1]
    var a = mainArray.testArray[number][0] //получаем значение выделенной ячейки
    
    var i = 0
    repeat {
        if a == mainArray.testArray[i][0] && i != number && mainArray.testArray[i][0] != "" && mainArray.testArray[i][3] == "0" {
            mainArray.testArray[i][1] = "4"
        }
        i += 1
    } while i < mainArray.testArray.count
}
