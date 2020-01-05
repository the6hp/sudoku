import Foundation

func swap_rows_area_all (array: [Int]) -> [Int]  {
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
    
    var i: Int = 0
    var a: Int = one * 27
    var b: Int = two * 27
    
    repeat {
        let c:Int = originalMassiv[a]
        originalMassiv[a] = originalMassiv[b]
        originalMassiv[b] = c
        
        a += 1
        b += 1
        i += 1
    } while i < 27
    
    return originalMassiv
}
