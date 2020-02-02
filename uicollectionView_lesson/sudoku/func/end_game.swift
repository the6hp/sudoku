import Foundation


func end_game_all () -> Bool {
    var res:Bool = false
    //1.Создаём String массив
    var stringArray = [String]()
    var i = 0
    repeat {
        stringArray.append(mainArray.testArray[i][0])
        i += 1
    } while i <= 80
    
    //2. Прооеряем заполняемость поля
    
    var array_null: Bool = false
    if check_array_on_null_all(array: stringArray) == true {
        array_null = true
    }
    
    //3. Переводим string в массив int
    
    let intArray = string_to_int_all(array: stringArray)
    
    //4. Проверяем правильность решения
    
    if array_null == true {
        if check_array_all(array: intArray) == true {
            res = true
        }
    }
    
        return res
}
