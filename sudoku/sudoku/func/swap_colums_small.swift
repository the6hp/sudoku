import Foundation

func swap_colums_small_all (array: [Int]) -> [Int] {
    var allNumbersSwap_colums_small = array
    let randomSector = Int.random(in: 0..<9)
           var randomSectorTwo: Int = 0
           var randomHelp: Int = 0
           switch randomSector {
           case 0:
               randomSectorTwo = Int.random(in: 1..<3)
           case 1:
               randomHelp = Int.random(in: 0..<2)
               if randomHelp == 0 {
                   randomSectorTwo = 0
               } else {
                   randomSectorTwo = 2
               }
           case 2:
               randomSectorTwo = Int.random(in: 0..<2)
           case 3:
               randomSectorTwo = Int.random(in: 4..<6)
           case 4:
               randomHelp = Int.random(in: 0..<2)
               if randomHelp == 0 {
                   randomSectorTwo = 3
               } else {
                   randomSectorTwo = 5
               }
           case 5:
               randomSectorTwo = Int.random(in: 3..<5)
           case 6:
               randomSectorTwo = Int.random(in: 7..<9)
           case 7:
               randomHelp = Int.random(in: 0..<2)
               if randomHelp == 0 {
                   randomSectorTwo = 6
               } else {
                   randomSectorTwo = 8
               }
           case 8:
               randomSectorTwo = Int.random(in: 6..<8)
           default:
               break
           }

           //Получаем номера элементов для замены
           var massivNumberOneSwap_rows_small = [Int]()
           var massivNumberTwoSwap_rows_small = [Int]()
           
           var i: Int = 0
           var a:Int = randomSector
           var b:Int = randomSectorTwo
           
           repeat {
               massivNumberOneSwap_rows_small.append(a)
               massivNumberTwoSwap_rows_small.append(b)
               a += 9
               b += 9
               i += 1
           } while i < 9

           var i_NumberSwap_rows_small = 0
           var numberOriginalMassivSwap_rows_small: Int = 0
           var oneNumberMassivSwap_rows_small: Int = 0
           var twoNumberMassivSwap_rows_small: Int = 0
           
           repeat {
            let a: Int = massivNumberOneSwap_rows_small[oneNumberMassivSwap_rows_small]
            let b: Int = massivNumberTwoSwap_rows_small[twoNumberMassivSwap_rows_small]
               numberOriginalMassivSwap_rows_small = allNumbersSwap_colums_small[a]
               allNumbersSwap_colums_small[a] = allNumbersSwap_colums_small[b]
               allNumbersSwap_colums_small[b] = numberOriginalMassivSwap_rows_small
               oneNumberMassivSwap_rows_small += 1
               twoNumberMassivSwap_rows_small += 1
               i_NumberSwap_rows_small += 1
           } while i_NumberSwap_rows_small < 9
           
    return allNumbersSwap_colums_small
}
