//
//  Выделение ошибок
//


import Foundation

func error_number_all () {
    
    
    
    let sector_1 = [0,1,2,9,10,11,18,19,20]
    let sector_2 = [3,4,5,12,13,14,21,22,23]
    let sector_3 = [6,7,8,15,16,17,24,25,26]
    let sector_4 = [27,28,29,36,37,38,45,46,47]
    let sector_5 = [30,31,32,39,40,41,48,49,50]
    let sector_6 = [33,34,35,42,43,44,51,52,53]
    let sector_7 = [54,55,56,63,64,65,72,73,74]
    let sector_8 = [57,58,59,66,67,68,75,76,77]
    let sector_9 = [60,61,62,69,70,71,78,79,80]

    
    let a = variables.selectCell![1] //Номер выбранной ячейки
    let b = mainArray.testArray[a][0] //Значение выделенной ячейки

    
//    select_line_and_area_all(number: a)
//    same_number_all()
// Найдём сектор
// ------------------------------

    
var sectorNumber = 0
    
var i_sector = 0
    
    repeat {
        if a == sector_1[i_sector] {
            sectorNumber = 1
            break
        }
        i_sector += 1
    } while i_sector <= 8
    
    i_sector = 0
    
    repeat {
        if a == sector_2[i_sector] {
            sectorNumber = 2
            break
        }
        i_sector += 1
    } while i_sector <= 8
    
    i_sector = 0
    
    repeat {
        if a == sector_3[i_sector] {
            sectorNumber = 3
            break
        }
        i_sector += 1
    } while i_sector <= 8
    
    i_sector = 0
    
    repeat {
        if a == sector_4[i_sector] {
            sectorNumber = 4
            break
        }
        i_sector += 1
    } while i_sector <= 8
    
    i_sector = 0
    
    repeat {
        if a == sector_5[i_sector] {
            sectorNumber = 5
            break
        }
        i_sector += 1
    } while i_sector <= 8
    
    i_sector = 0
    
    repeat {
        if a == sector_6[i_sector] {
            sectorNumber = 6
            break
        }
        i_sector += 1
    } while i_sector <= 8
    
    i_sector = 0
    
    repeat {
        if a == sector_7[i_sector] {
            sectorNumber = 7
            break
        }
        i_sector += 1
    } while i_sector <= 8
    
    i_sector = 0
    
    repeat {
        if a == sector_8[i_sector] {
            sectorNumber = 8
            break
        }
        i_sector += 1
    } while i_sector <= 8
    
    i_sector = 0
    
    repeat {
        if a == sector_9[i_sector] {
            sectorNumber = 9
            break
        }
        i_sector += 1
    } while i_sector <= 8
        
    // Найдём все ячейки, в которых содержится выбранное число
        var array_a = [Int]()  //   массив всех номеров ячеек, где содержится выбранное число
        var i  = 0
        repeat {
            if b == mainArray.testArray[i][0] && mainArray.testArray[i][0] != "" && i != a {
                array_a.append(i)
            }
            i +=  1
        } while i <=  80
        
    i = 0
    // -----------------------------------------------
    // Найдём ячейки, в которых содержится выбранное число только в нужном секторе
    
    var finalArray = [Int]()
    var n = 0
    var m = 0
    switch sectorNumber {
    case 1:
        if array_a.count != 0 {
            repeat {
                repeat {
                    if array_a[m] == sector_1[n] {
                        finalArray.append(array_a[m])
                    }
                    n += 1
                } while n <= 8
                n = 0
                m += 1
            } while m < array_a.count
        }
    case 2:
                if array_a.count != 0 {
            repeat {
                repeat {
                    if array_a[m] == sector_2[n] {
                        finalArray.append(array_a[m])
                    }
                    n += 1
                } while n <= 8
                n = 0
                m += 1
            } while m < array_a.count
        }
    case 3:
                        if array_a.count != 0 {
            repeat {
                repeat {
                    if array_a[m] == sector_3[n] {
                        finalArray.append(array_a[m])
                    }
                    n += 1
                } while n <= 8
                n = 0
                m += 1
            } while m < array_a.count
        }
    case 4:
                        if array_a.count != 0 {
            repeat {
                repeat {
                    if array_a[m] == sector_4[n] {
                        finalArray.append(array_a[m])
                    }
                    n += 1
                } while n <= 8
                n = 0
                m += 1
            } while m < array_a.count
        }
    case 5:
                        if array_a.count != 0 {
            repeat {
                repeat {
                    if array_a[m] == sector_5[n] {
                        finalArray.append(array_a[m])
                    }
                    n += 1
                } while n <= 8
                n = 0
                m += 1
            } while m < array_a.count
        }
    case 6:
                        if array_a.count != 0 {
            repeat {
                repeat {
                    if array_a[m] == sector_6[n] {
                        finalArray.append(array_a[m])
                    }
                    n += 1
                } while n <= 8
                n = 0
                m += 1
            } while m < array_a.count
        }
    case 7:
                        if array_a.count != 0 {
            repeat {
                repeat {
                    if array_a[m] == sector_7[n] {
                        finalArray.append(array_a[m])
                    }
                    n += 1
                } while n <= 8
                n = 0
                m += 1
            } while m < array_a.count
        }
    case 8:
                        if array_a.count != 0 {
            repeat {
                repeat {
                    if array_a[m] == sector_8[n] {
                        finalArray.append(array_a[m])
                    }
                    n += 1
                } while n <= 8
                n = 0
                m += 1
            } while m < array_a.count
        }
    case 9:
                        if array_a.count != 0 {
            repeat {
                repeat {
                    if array_a[m] == sector_9[n] {
                        finalArray.append(array_a[m])
                    }
                    n += 1
                } while n <= 8
                n = 0
                m += 1
            } while m < array_a.count
        }
    default:
        break
    }
    
    n = 0
    m = 0
    
    
// ----------------------
// Поиск в столбце
    var colums = variables.selectCell![1] % 9
    var arrayColums = [Int]()
    var i_arrayColums = 0
    repeat {
        arrayColums.append(colums)
        colums += 9
        i_arrayColums += 1
    } while i_arrayColums < 9
    
    var p = 0
    repeat {
        if mainArray.testArray[arrayColums[p]][0] == mainArray.testArray[a][0] && arrayColums[p] != a {
            finalArray.append(arrayColums[p])
        }
    p += 1
    } while p < 9

// ----------------------
// Поиск в строке
    var line = variables.selectCell![1] / 9
    var startLine = line * 9
    var h = 0
    repeat {
        if mainArray.testArray[startLine][0] == mainArray.testArray[a][0] && startLine != a {
            finalArray.append(startLine)
        }
    startLine += 1
    h += 1
    } while h < 9


// ----------------------

    
    if b != "" && finalArray.count != 0 {
        var count = 0
        repeat {
            mainArray.testArray[finalArray[count]][1] = "5"
            count += 1
        } while count < finalArray.count
        
        if  count > 0 {
            variables.countError += 1
        }
    }
}


