import Foundation

func check_array_all (array: [Int]) -> Bool {
    var res: Bool = true
    var funcMassiv = array
    let brillianMassiv = [1,2,3,4,5,6,7,8,9]
    var massiv_test = [Int]()
    //Проверка по горизонтале
    var n = 0
    repeat {
        var i = 0
        repeat {
            massiv_test.append(funcMassiv[n])
            i += 1
            n += 1
        } while i <= 8
        let massiv_sort = massiv_test.sorted()
        if massiv_sort != brillianMassiv {
            res = false
        }
        massiv_test = [Int]()
        i = 0
    } while n < 81
//Проверка по вертикале
    n = 0
    var m = 0
    repeat {
        var i = 0
        repeat {
            massiv_test.append(funcMassiv[n])
            i += 1
            n += 9
        } while i <= 8
        let massiv_sort = massiv_test.sorted()
        if massiv_sort != brillianMassiv {
            res = false
        }
        massiv_test = [Int]()
        m += 1
        n = m
        i = 0
    } while m <= 8
    
    return res
}
