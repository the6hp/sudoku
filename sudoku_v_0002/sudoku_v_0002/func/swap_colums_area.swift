import Foundation

func swap_colums_area_all (array: [Int]) -> [Int]  {
    //Определяем два района по горизонтали для обмена
    var originalMassiv = array
    let one: Int = Int.random(in: 0..<3)
    var two: Int = 0
    switch one {
    case 0:
        two = Int.random(in: 1..<3)
    case 1:
        let randomCase: Int = Int.random(in: 0..<2)
        if randomCase == 0 {
            two = 0
        } else {
            two = 2
        }
    case 2:
        two = Int.random(in: 0..<2)
    default:
        break
    }
    
    print(one)
    print(two)
    
    
    var a: Int = one * 3
    var b: Int = two * 3
    var i: Int = 0
    var i_2: Int = 0
    repeat {
        repeat {
            let c:Int = originalMassiv[a]
            originalMassiv[a] = originalMassiv[b]
            originalMassiv[b] = c
            a += 1
            b += 1
            i_2 += 1
        } while i_2 < 3
        
        i_2 = 0
        a += 6
        b += 6
        i += 1
    } while i < 9

    return originalMassiv
}
