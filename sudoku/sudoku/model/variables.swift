import Foundation
import UIKit

struct key {
    static let MSAppCenter_Key: String = ""
}

struct variables {
    static var selectCell: IndexPath? //номер выбанной ячейки на игровом поле
    static var changeButtonNote: Int = 0 //состояние кнопки Заметка
    static var savedGame: Bool = false //Есть ли начатая игра
    static var countError: Int = 0 // Количество ошибок
    static var countMin: Int = 0 // Минуты в таймере
    static var countSec: Int = 0 // Секунды в таймере
    static var levelGame: Int = 0 // Сложность игры
    static var timeArray = [Int]() // Массив с временами игр
    static var customGameNumber: Int = 35 //Количество свободных ячеек для кастомной игры
    
    
    
    static var hiddenCell: Bool = false
    
    //Заполнение цветом ячеек
    static var color1: CGColor = #colorLiteral(red: 0.9366177917, green: 0.9310500026, blue: 0.9408977628, alpha: 1) //1 - Обычный стартовый фон всего поля
    static var color2: CGColor = #colorLiteral(red: 0.7607843137, green: 0.8666666667, blue: 0.9725490196, alpha: 1) //2 - Фон выбранной ячейки
    static var color3: CGColor = #colorLiteral(red: 0.8901960784, green: 0.9058823529, blue: 0.9294117647, alpha: 1) //3 - Фон выделения областей при выборе ячейки
    static var color4: CGColor = #colorLiteral(red: 0.8078431373, green: 0.8588235294, blue: 0.9215686275, alpha: 1) //4 - Фон выделения ячейки одинаковых чисел при выборе числа
    static var color7: CGColor = #colorLiteral(red: 0.9450980392, green: 0.8196078431, blue: 0.8392156863, alpha: 1) //5 - Фон выделения ячейки при ошибке
    //Цвет текста
    static var color5: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) //1 - Цвет шрифта изначальных значений
    static var color6: UIColor = #colorLiteral(red: 0.3607843137, green: 0.5607843137, blue: 0.9215686275, alpha: 1) //2 - Цвет шрифта заполненных пользователем значений
    
    
    static var color1night: CGColor = #colorLiteral(red: 0.2006309927, green: 0.2068673968, blue: 0.243512094, alpha: 1) //1 - Обычный стартовый фон всего поля
    static var color2night: CGColor = #colorLiteral(red: 0.2120132148, green: 0.2513697445, blue: 0.9431367517, alpha: 1) //2 - Фон выбранной ячейки
    static var color3night: CGColor = #colorLiteral(red: 0.1137254902, green: 0.1137254902, blue: 0.1411764706, alpha: 1) //3 - Фон выделения областей при выборе ячейки
    static var color4night: CGColor = #colorLiteral(red: 0.8078431373, green: 0.8588235294, blue: 0.9215686275, alpha: 1) //4 - Фон выделения ячейки одинаковых чисел при выборе числа
    static var color7night: CGColor = #colorLiteral(red: 0.9450980392, green: 0.8196078431, blue: 0.8392156863, alpha: 1) //5 - Фон выделения ячейки при ошибке
    //Цвет текста
    static var color5night: UIColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1) //1 - Цвет шрифта изначальных значений
    static var color6night: UIColor = #colorLiteral(red: 0.3607843137, green: 0.5607843137, blue: 0.9215686275, alpha: 1) //2 - Цвет шрифта заполненных пользователем значений   
}

struct statistics {
    // easy
    static var statisticsEasyGamesPlayed: Int = 0
    static var statisticEasyGamesCompleted: Int = 0
    static var statisticEasyWinRate: Int = 0
    static var statisticEasyBestWinStreak: Int = 0
    static var statisticEasyBestTime: Int = 0
    static var statisticEasyAverageTime: Int = 0
    // average
    static var statisticsAverageGamesPlayed: Int = 0
    static var statisticAverageGamesCompleted: Int = 0
    static var statisticAverageWinRate: Int = 0
    static var statisticAverageBestWinStreak: Int = 0
    static var statisticAverageBestTime: Int = 0
    static var statisticAverageAverageTime: Int = 0
    // hard
    static var statisticsHardGamesPlayed: Int = 0
    static var statisticHardGamesCompleted: Int = 0
    static var statisticHardWinRate: Int = 0
    static var statisticHardBestWinStreak: Int = 0
    static var statisticHardBestTime: Int = 0
    static var statisticHardAverageTime: Int = 0
    // expert
    static var statisticsExpertGamesPlayed: Int = 0
    static var statisticExpertGamesCompleted: Int = 0
    static var statisticExpertWinRate: Int = 0
    static var statisticExpertBestWinStreak: Int = 0
    static var statisticExpertBestTime: Int = 0
    static var statisticExpertAverageTime: Int = 0
}

struct settings {
    static var sound: Bool = false
    static var autolockScreen : Bool = true
    static var timer: Bool = true
    static var errorLimit: Bool = true
    static var autocheckError: Bool = true
    static var hideUsedNumbers: Bool = true
    static var selectRepeating: Bool = true
    static var selectedArea: Bool = true
    static var selectedSameNumber: Bool = true
    static var autoDeleteNote : Bool = true
    static var nightMode : Bool = false
}


struct store {
    static  var countGame: Int = 0
}
