import Foundation



func best_average_time_all (level: Int) {
    var  allTime: Int = variables.countMin * 60 + variables.countSec
    var timeArray = [Int]()
    
    variables.timeArray.append(allTime)
    
    var i = 0
    var timeAverage = 0
    repeat {
        timeAverage += variables.timeArray[i]
        i += 1
    } while i < variables.timeArray.count
    timeAverage = timeAverage / variables.timeArray.count
    
    
    var sortArray = variables.timeArray.sorted()
    var minTime = sortArray[0]
    
    
    
    
    switch level {
    case 0:
        statistics.statisticEasyAverageTime = timeAverage
        statistics.statisticEasyBestTime = minTime
    case 1:
        statistics.statisticAverageAverageTime = timeAverage
        statistics.statisticAverageBestTime = minTime
    case 2:
        statistics.statisticHardAverageTime = timeAverage
        statistics.statisticHardBestTime = minTime
    case 3:
        statistics.statisticExpertAverageTime = timeAverage
        statistics.statisticExpertBestTime = minTime
    default:
        break
    }
    
    saveData()
    
    print("Общее время: ", allTime)
    print("Массив времени: ", variables.timeArray)
    print("Среднее время: ", timeAverage)
    print("Лучшее время: ", minTime)


}
