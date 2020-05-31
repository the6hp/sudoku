//
//  Удаляем "0", чтобы на поле была пустая ячейка
//


import Foundation

func delete_0_all () {

   var i = 0
    repeat {
        
        if mainArray.allNumbers_text[i] == "0" {
            mainArray.allNumbers_text[i] = ""
        }
        
        i += 1
    } while i < mainArray.testArray.count
    
}
