
import Foundation

func solving(board: [[Int]]) -> [String] {
    var board = board
    var isSolved = false
    while !isSolved {
        for x in 0 ..< 9  {
            for y in 0 ..< 9 {
                if board[x][y] == 0 {
                    let known = Set(board.map { $0[y] } + board[x] + subgrid(board, pos: (x, y)))
                    let possible = Set(Array(1...9)).subtracting(known)
                    if possible.count == 1  {
                        board[x][y] = possible.first!
                    }
                }
            }
            isSolved = 45 == board[x].reduce(0, +)
        }
    }
    
    var a = 0 // Девять секторов
    var b = 0 //Девять значений в секторе
    var c = 0 // Номер порядковый в переходном массиве
    var l_array = [String]()
    
    repeat {
        repeat {
            l_array.append("\(board[b][a])")
            c += 1
            a += 1
        } while a < 9
        a = 0
        b += 1
    } while b < 9
    
    
    return l_array
}
 
func subgrid(_ board: [[Int]], pos: (Int, Int)) -> [Int] {
    var r = [Int]()
    var (x, y) = pos
    x = x / 3 * 3
    y = y / 3 * 3
    for i in x ..< x + 3 {
        for j in y ..< y + 3 {
            r.append(board[i][j])
        }
    }
    return r
}
 
var puzzle = [
    [0,2,0,4,5,0,7,0,9],
    [0,0,0,1,0,9,0,3,0],
    [0,0,8,0,0,0,1,0,4],
    [0,4,0,0,6,1,0,7,0],
    [5,0,6,0,3,0,0,1,0],
    [0,3,0,0,0,2,0,9,0],
    [3,0,4,0,7,5,0,6,8],
    [0,9,0,0,1,0,3,0,7],
    [0,0,2,0,0,3,0,0,1]
]
 

//   solving(board: puzzle)

// mainArray.allNumbers_text


func inputArray (array: [String]) -> [[Int]] {
    var outputArray = [
        [0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0]
    ]
    var a = 0 //сектор
    var b = 0 // номер в секторе
    var i  = 0 //общее число номеров
    
    repeat {
        repeat {
           outputArray[a][b] = Int(array[i]) ?? 0
            i += 1
            b += 1
        } while b < 9
        
        b  = 0
        a += 1
    } while a < 9
    
    return outputArray
}
