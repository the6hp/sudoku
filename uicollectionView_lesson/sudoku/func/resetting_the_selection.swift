//
//  Сбрасываем все выделения ячеек кроме подсветки сектора и линий
//

import Foundation

func resetting_the_selection_all() {
   var i = 0
    repeat {
        
        if mainArray.testArray[i][1] != "1" {
            mainArray.testArray[i][1] = "1"
        }
        
        
        i += 1
    } while i < mainArray.testArray.count
    
    if variables.selectCell != nil {
        let a = variables.selectCell![1]
        mainArray.testArray[a][1] = "2"
        select_line_and_area_all(number: a)

    }

    
}




