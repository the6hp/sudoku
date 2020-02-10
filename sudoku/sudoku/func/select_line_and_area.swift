//Выделение зоны и линий по горизонтале и вертикале при тапе по ячейке
//На воходе получаем номер ячейки. Далее проходим по всем ячейкам и если их цвет соотвествует цвету выделения, то сбрасываем его.
//Потом на основе входного номера ячейки выделяем новые ячейки

import Foundation

func select_line_and_area_all (number: Int) {
    
    if settings.selectedArea == true {
    
    //Делаем новые выделения
    let line_h_1 = [0,1,2,9,10,11,18,19,20]
    let line_h_2 = [3,4,5,12,13,14,21,22,23]
    let line_h_3 = [6,7,8,15,16,17,24,25,26]
    let line_h_4 = [27,28,29,36,37,38,45,46,47]
    let line_h_5 = [30,31,32,39,40,41,48,49,50]
    let line_h_6 = [33,34,35,42,43,44,51,52,53]
    let line_h_7 = [54,55,56,63,64,65,72,73,74]
    let line_h_8 = [57,58,59,66,67,68,75,76,77]
    let line_h_9 = [60,61,62,69,70,71,78,79,80]
    
    //Выделение сектора
    let max:Int = 0
    repeat {
        var i:Int = 0
        repeat {
            if number == line_h_1[i] {
                var i_h_1 = 0
                repeat {
                    let n_h_1 = line_h_1[i_h_1]
                    
                    if mainArray.testArray [n_h_1][1] == "1" {
                        mainArray.testArray[n_h_1][1] = "3"
                    }
                    i_h_1 += 1
                } while i_h_1 <= 8
                break
            }
            i += 1
        } while i <= 8
        
        
        i = 0
        repeat {
            if number == line_h_2[i] {
                var i_h_2 = 0
                repeat {
                    let n_h_2 = line_h_2[i_h_2]
                    
                    if mainArray.testArray [n_h_2][1] == "1" {
                        mainArray.testArray[n_h_2][1] = "3"
                    }
                    i_h_2 += 1
                } while i_h_2 <= 8
                break
            }
            i += 1
        } while i <= 8
        
        i = 0
        repeat {
            if number == line_h_3[i] {
                var i_h_3 = 0
                repeat {
                    let n_h_3 = line_h_3[i_h_3]
                    
                    if mainArray.testArray [n_h_3][1] == "1" {
                        mainArray.testArray[n_h_3][1] = "3"
                    }
                    i_h_3 += 1
                } while i_h_3 <= 8
                break
            }
            i += 1
        } while i <= 8
        
        i = 0
        repeat {
            if number == line_h_4[i] {
                var i_h_4 = 0
                repeat {
                    let n_h_4 = line_h_4[i_h_4]
                    
                    if mainArray.testArray [n_h_4][1] == "1" {
                        mainArray.testArray[n_h_4][1] = "3"
                    }
                    i_h_4 += 1
                } while i_h_4 <= 8
                break
            }
            i += 1
        } while i <= 8
        
        i = 0
        repeat {
            if number == line_h_5[i] {
                var i_h_5 = 0
                repeat {
                    let n_h_5 = line_h_5[i_h_5]
                    if mainArray.testArray [n_h_5][1] == "1" {
                        mainArray.testArray[n_h_5][1] = "3"
                    }
                    i_h_5 += 1
                } while i_h_5 <= 8
                break
            }
            i += 1
        } while i <= 8
        
        i = 0
        repeat {
            if number == line_h_6[i] {
                var i_h_6 = 0
                repeat {
                    let n_h_6 = line_h_6[i_h_6]
                    
                    if mainArray.testArray [n_h_6][1] == "1" {
                        mainArray.testArray[n_h_6][1] = "3"
                    }
                    i_h_6 += 1
                } while i_h_6 <= 8
                break
            }
            i += 1
        } while i <= 8
        
        i = 0
        repeat {
            if number == line_h_7[i] {
                var i_h_7 = 0
                repeat {
                    let n_h_7 = line_h_7[i_h_7]
                    
                    if mainArray.testArray [n_h_7][1] == "1" {
                        mainArray.testArray[n_h_7][1] = "3"
                    }
                    i_h_7 += 1
                } while i_h_7 <= 8
                break
            }
            i += 1
        } while i <= 8
        
        i = 0
        repeat {
            if number == line_h_8[i] {
                var i_h_8 = 0
                repeat {
                    let n_h_8 = line_h_8[i_h_8]
                    
                    if mainArray.testArray [n_h_8][1] == "1" {
                        mainArray.testArray[n_h_8][1] = "3"
                    }
                    i_h_8 += 1
                } while i_h_8 <= 8
                break
            }
            i += 1
        } while i <= 8

       i = 0
       repeat {
           if number == line_h_9[i] {
               var i_h_9 = 0
               repeat {
                let n_h_9 = line_h_9[i_h_9]
                   
                   if mainArray.testArray [n_h_9][1] == "1" {
                       mainArray.testArray[n_h_9][1] = "3"
                   }
                   i_h_9 += 1
               } while i_h_9 <= 8
               break
           }
           i += 1
       } while i <= 8
        
    } while max < 0
    
    //Выделение строк и столбцов
    //Номер строки
    let line:Int = number / 9
    //Номер столбца
    let column:Int = number % 9

    //Выделяем строку
    var i = 0
    var startNumberLine: Int = line * 9
    repeat {
        if mainArray.testArray[startNumberLine][1] == "1" {
            mainArray.testArray[startNumberLine][1] = "3"
        }
        startNumberLine += 1
        i += 1
    } while i < 9
    
    
    //Выделяем столбец
    i = 0
    var startNumberColumn: Int = column
    repeat {
        if mainArray.testArray[startNumberColumn][1] == "1" {
            mainArray.testArray[startNumberColumn][1] = "3"
        }
        startNumberColumn += 9
        i += 1
    } while i < 9
    
    }
}
