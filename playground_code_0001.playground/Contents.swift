    var allNumbers = [1,2,3,4,5,6,7,8,9,4,5,6,7,8,9,1,2,3,7,8,9,1,2,3,4,5,6,2,3,4,5,6,7,8,9,1,5,6,7,8,9,1,2,3,4,8,9,1,2,3,4,5,6,7,3,4,5,6,7,8,9,1,2,6,7,8,9,1,2,3,4,5,9,1,2,3,4,5,6,7,8]

    
    func swap (array: [Int]) -> [Int]  {
        //Определяем два района по горизонтали для обмена
        var originalMassiv = array
        let one: Int = Int.random(in: 0..<3)
        var two: Int = 0
        switch one {
        case 0:
            two = Int.random(in: 1..<3)
        case 1:
            var randomCase: Int = Int.random(in: 0..<2)
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
        print("Первый сектор по горизонтале: ", one)
        print("Второй сектор по вертикале: ", two)
        
        var i: Int = 0
        var a: Int = 0
        var b: Int = 0
        var c: Int = 0
        
        repeat {
            a = one * 27
            b = two * 27
            
            c = originalMassiv[a]
            originalMassiv[a] = originalMassiv[b]
            originalMassiv[b] = c
            
            a += 1
            b += 1
            i += 1
        } while i < 28
        
        return originalMassiv
    }
    
    swap(array: allNumbers)
