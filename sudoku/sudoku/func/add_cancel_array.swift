import Foundation


func add_cancel_array_all (Number: Int) {
    var a = mainArray.testArray[Number]  //промежуточный массив
    let b = "\(Number)"
    a.insert(b, at: 13)
    mainArray.oldCancelArray.append(a)
    
    saveData()
}
