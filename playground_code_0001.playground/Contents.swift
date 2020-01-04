    var allNumbers = [1,2,3,4,5,6,7,8,9,4,5,6,7,8,9,1,2,3,7,8,9,1,2,3,4,5,6,2,3,4,5,6,7,8,9,1,5,6,7,8,9,1,2,3,4,8,9,1,2,3,4,5,6,7,3,4,5,6,7,8,9,1,2,6,7,8,9,1,2,3,4,5,9,1,2,3,4,5,6,7,8]

    
    
    func transposing () {
        var newNumbersTransposing = [Int?]()
        var mTransposing:Int = 0
        let nTransposing:Int = 9
        var countNumberTransposing = 0
        repeat {
            repeat {
                let cTransposing = allNumbers[countNumberTransposing]
                newNumbersTransposing.append(cTransposing)
                countNumberTransposing = countNumberTransposing + nTransposing
            } while countNumberTransposing <= 80
            
            mTransposing = mTransposing + 1
            countNumberTransposing = mTransposing
        } while mTransposing <= 8
        
        
        print(newNumbersTransposing)
        
        
        newNumbersTransposing[1] = nil
        
        print(newNumbersTransposing)

    }
    
    transposing()
