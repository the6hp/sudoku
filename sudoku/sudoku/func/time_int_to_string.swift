import Foundation

func time_int_to_string_bestTime (level: Int) -> String {
    var bestTime = 0
    
    var bestTimeString = ""
    
    switch level {
    case 0:
        bestTime = statistics.statisticEasyBestTime
    case 1:
        bestTime = statistics.statisticAverageBestTime
    case 2:
        bestTime = statistics.statisticHardBestTime
    case 3:
        bestTime = statistics.statisticExpertBestTime
    default:
        break
    }
    
    
    let minBestTime = bestTime / 60
    let secBestTime = bestTime - minBestTime * 60
    
    
    if minBestTime == 0 && secBestTime == 0 {
        bestTimeString = "00:00"
    } else if minBestTime < 10 && secBestTime == 0 {
        bestTimeString = "0\(minBestTime):00"
    } else if minBestTime == 0 && secBestTime < 10 {
        bestTimeString = "00:0\(secBestTime)"
    } else if minBestTime < 10 && secBestTime < 10 {
        bestTimeString = "0\(minBestTime):0\(secBestTime)"
    } else if minBestTime < 10 && secBestTime >= 10 {
        bestTimeString = "0\(minBestTime):\(secBestTime)"
    } else if minBestTime >= 10 && secBestTime < 10 {
        bestTimeString = "\(minBestTime):0\(secBestTime)"
    } else if minBestTime >= 10 && secBestTime >= 10 {
        bestTimeString = "\(minBestTime):\(secBestTime)"
    }
        
    return  (bestTimeString)
}


func time_int_to_string_averageTime (level: Int) -> String {
    var averageTime = 0
    
    var averageTimeString = ""
    
    switch level {
    case 0:
        averageTime = statistics.statisticEasyAverageTime
    case 1:
        averageTime = statistics.statisticAverageAverageTime
    case 2:
        averageTime = statistics.statisticHardAverageTime
    case 3:
        averageTime = statistics.statisticExpertAverageTime
    default:
        break
    }
    
    
    let minAverageTime = averageTime / 60
    let secAverageTime = averageTime - minAverageTime * 60
    
    
    if minAverageTime == 0 && secAverageTime == 0 {
        averageTimeString = "00:00"
    } else if minAverageTime < 10 && secAverageTime == 0 {
        averageTimeString = "0\(minAverageTime):00"
    } else if minAverageTime == 0 && secAverageTime < 10 {
        averageTimeString = "00:0\(secAverageTime)"
    } else if minAverageTime < 10 && secAverageTime < 10 {
        averageTimeString = "0\(minAverageTime):0\(secAverageTime)"
    } else if minAverageTime < 10 && secAverageTime >= 10 {
        averageTimeString = "0\(minAverageTime):\(secAverageTime)"
    } else if minAverageTime >= 10 && secAverageTime < 10 {
        averageTimeString = "\(minAverageTime):0\(secAverageTime)"
    } else if minAverageTime >= 10 && secAverageTime >= 10 {
        averageTimeString = "\(minAverageTime):\(secAverageTime)"
    }
        
    return  (averageTimeString)
}
