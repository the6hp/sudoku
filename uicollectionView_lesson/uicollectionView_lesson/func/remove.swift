import Foundation

func remove_all (array: [Int]) -> [String] {
    var resMassiv = [String]()
        var i = 0
        repeat {
            var a = String(array[i])
            resMassiv.append(a)
            i += 1
        } while i < array.count
        
    var countDelete: Int = 0
    
    repeat {
        var a = Int.random(in: 0..<81)
        resMassiv[a] = ""
        countDelete += 1
    } while countDelete < 40

    return resMassiv
}
