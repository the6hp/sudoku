import Foundation
import UIKit


struct variables {
    static var selectCell: IndexPath? //номер выбанной ячейки на игровом поле
    static var changeButtonNote: Int = 0 //состояние кнопки Заметка
    static var savedGame:Bool = false //Есть ли начатая игра
    
    
    //Заполнение цветом ячеек
    static var color1: CGColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //1 - Обычный стартовый фон всего поля
    static var color2: CGColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1) //2 - Фон выбранной ячейки
    static var color3: CGColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 0.2493122799) //3 - Фон выделения областей при выборе ячейки
    static var color4: CGColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1) //4 - Фон выделения ячейки одинаковых чисел при выборе числа
    //Цвет текста
    static var color5: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) //1 - Цвет шрифта изначальных значений
    static var color6: UIColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1) //2 - Цвет шрифта заполненных пользователем значений

}




