import Foundation

func statistics_fill_all (level: Int) {
    
    switch level {
    case 0:
        statistics.statisticEasyWinRate = (statistics.statisticEasyGamesCompleted * 100)/statistics.statisticsEasyGamesPlayed
    case 1:
        statistics.statisticAverageWinRate = (statistics.statisticAverageGamesCompleted * 100)/statistics.statisticsAverageGamesPlayed
    case 2:
        statistics.statisticHardWinRate = (statistics.statisticHardGamesCompleted * 100)/statistics.statisticsHardGamesPlayed
    case 3:
        statistics.statisticExpertWinRate = (statistics.statisticExpertGamesCompleted * 100)/statistics.statisticsExpertGamesPlayed
    default:
        break
    }
}
