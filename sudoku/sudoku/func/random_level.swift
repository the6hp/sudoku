import Foundation

func random_level_all () {
    let a = Int.random(in: 1..<10)
    let b = Int.random(in: 1..<100)
    let c = Int.random(in: 1..<100)
    let d = Int.random(in: 1..<100)
    let e = Int.random(in: 1..<100)
    var a_a: Int = 0
    var b_b: Int = 0
    var c_c: Int = 0
    var d_d: Int = 0
    var e_e: Int = 0
    
    repeat {
        mainArray.allNumbers = transposing(array: mainArray.baseAllNumbers)
        a_a += 1
    } while a_a < a
    
    repeat {
        mainArray.allNumbers = swap_rows_area_all(array: mainArray.allNumbers)
        b_b += 1
    } while b_b < b
    
    repeat {
        mainArray.allNumbers = swap_rows_small_all(array: mainArray.allNumbers)
        c_c += 1
    } while c_c < c
    
    repeat {
        mainArray.allNumbers = swap_colums_area_all(array: mainArray.allNumbers)
        d_d += 1
    } while d_d < d
    
    repeat {
        mainArray.allNumbers = swap_colums_small_all(array: mainArray.allNumbers)
        e_e += 1
    } while e_e < e
}
