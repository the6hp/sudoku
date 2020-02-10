import Foundation



func best_average_time_all (level: Int) {
    let  allTime: Int = variables.countMin * 60 + variables.countSec
    _ = [Int]()
    
    variables.timeArray.append(allTime)
    
    var i = 0
    var timeAverage = 0
    repeat {
        timeAverage += variables.timeArray[i]
        i += 1
    } while i < variables.timeArray.count
    timeAverage = timeAverage / variables.timeArray.count
    
    
    let sortArray = variables.timeArray.sorted()
    let minTime = sortArray[0]
    
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

}
