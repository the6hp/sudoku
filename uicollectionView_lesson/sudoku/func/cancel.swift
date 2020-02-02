import Foundation

func cancel_all () {
    if mainArray.oldCancelArray.count > 1 {
    let max = mainArray.oldCancelArray.count - 1
    let number:String = mainArray.oldCancelArray[max][13] as! String
    let numberInt = Int(number) ?? 0
    
    mainArray.testArray[numberInt] = mainArray.oldCancelArray[max] as! [String]
    mainArray.oldCancelArray.remove(at: max)
    
    var i = 0
        repeat {
            if i != numberInt {
            mainArray.testArray[i][1] = "1"
            } else {
            mainArray.testArray[i][1] = "2"
            }
            i += 1
        } while i < 81
        
    var a = [0, 0]
    a[1] = numberInt
    variables.selectCell![1] = numberInt
    select_line_and_area_all(number: numberInt)
    }
}
