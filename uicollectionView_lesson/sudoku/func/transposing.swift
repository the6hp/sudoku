import Foundation

func transposing (array: [Int]) -> [Int] {
    var newNumbersTransposing = [Int]()
    var mTransposing:Int = 0
    let nTransposing:Int = 9
    var countNumberTransposing: Int = 0
    repeat {
        repeat {
            let cTransposing = array[countNumberTransposing]
            newNumbersTransposing.append(cTransposing)
            countNumberTransposing = countNumberTransposing + nTransposing
        } while countNumberTransposing <= 80
        
        mTransposing = mTransposing + 1
        countNumberTransposing = mTransposing
    } while mTransposing <= 8
    
    return newNumbersTransposing
}
