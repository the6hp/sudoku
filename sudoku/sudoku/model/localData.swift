import Foundation

func saveData() {
    UserDefaults.standard.set(mainArray.testArray, forKey: "userArrayKey")
    UserDefaults.standard.set(mainArray.endArray, forKey: "endArray")

    UserDefaults.standard.set(variables.savedGame, forKey: "SaveGame")
    UserDefaults.standard.set(mainArray.oldCancelArray, forKey: "userOldArrayKey")
    UserDefaults.standard.set(variables.countSec, forKey: "countSec")
    UserDefaults.standard.set(variables.countMin, forKey: "countMin")
    UserDefaults.standard.set(variables.levelGame, forKey: "levelGame")
    UserDefaults.standard.set(variables.timeArray, forKey: "timeArray")
    UserDefaults.standard.set(variables.customGameNumber, forKey: "customGameNumber")
    UserDefaults.standard.set(store.countGame, forKey: "countGame")
    UserDefaults.standard.set(settings.sound, forKey: "setting_sound")
    UserDefaults.standard.set(settings.autolockScreen, forKey: "setting_autolockScreen")
    UserDefaults.standard.set(settings.timer, forKey: "setting_timer")
    UserDefaults.standard.set(settings.errorLimit, forKey: "setting_errorLimit")
    UserDefaults.standard.set(settings.autocheckError, forKey: "setting_autocheckError")
    UserDefaults.standard.set(settings.hideUsedNumbers, forKey: "setting_hideUsedNumbers")
    UserDefaults.standard.set(settings.selectRepeating, forKey: "setting_selectRepeating")
    UserDefaults.standard.set(settings.selectedArea, forKey: "setting_selectedArea")
    UserDefaults.standard.set(settings.selectedSameNumber, forKey: "setting_selectedSameNumber")
    UserDefaults.standard.set(settings.autoDeleteNote, forKey: "setting_autoDeleteNote")
    // Статистика
    UserDefaults.standard.set(statistics.statisticsEasyGamesPlayed, forKey: "statisticsEasyGamesPlayed")
    UserDefaults.standard.set(statistics.statisticEasyGamesCompleted, forKey: "statisticEasyGamesCompleted")
    UserDefaults.standard.set(statistics.statisticEasyWinRate, forKey: "statisticEasyWinRate")
    UserDefaults.standard.set(statistics.statisticEasyBestWinStreak, forKey: "statisticEasyBestWinStreak")
    UserDefaults.standard.set(statistics.statisticEasyBestTime, forKey: "statisticEasyBestTime")
    UserDefaults.standard.set(statistics.statisticEasyAverageTime, forKey: "statisticEasyAverageTime")

    UserDefaults.standard.set(statistics.statisticsAverageGamesPlayed, forKey: "statisticsAverageGamesPlayed")
    UserDefaults.standard.set(statistics.statisticAverageGamesCompleted, forKey: "statisticAverageGamesCompleted")
    UserDefaults.standard.set(statistics.statisticAverageWinRate, forKey: "statisticAverageWinRate")
    UserDefaults.standard.set(statistics.statisticAverageBestWinStreak, forKey: "statisticAverageBestWinStreak")
    UserDefaults.standard.set(statistics.statisticAverageBestTime, forKey: "statisticAverageBestTime")
    UserDefaults.standard.set(statistics.statisticAverageAverageTime, forKey: "statisticAverageAverageTime")

    UserDefaults.standard.set(statistics.statisticsHardGamesPlayed, forKey: "statisticsHardGamesPlayed")
    UserDefaults.standard.set(statistics.statisticHardGamesCompleted, forKey: "statisticHardGamesCompleted")
    UserDefaults.standard.set(statistics.statisticHardWinRate, forKey: "statisticHardWinRate")
    UserDefaults.standard.set(statistics.statisticHardBestWinStreak, forKey: "statisticHardBestWinStreak")
    UserDefaults.standard.set(statistics.statisticHardBestTime, forKey: "statisticHardBestTime")
    UserDefaults.standard.set(statistics.statisticHardAverageTime, forKey: "statisticHardAverageTime")
    
    UserDefaults.standard.set(statistics.statisticsExpertGamesPlayed, forKey: "statisticsExpertGamesPlayed")
    UserDefaults.standard.set(statistics.statisticExpertGamesCompleted, forKey: "statisticExpertGamesCompleted")
    UserDefaults.standard.set(statistics.statisticExpertWinRate, forKey: "statisticExpertWinRate")
    UserDefaults.standard.set(statistics.statisticExpertBestWinStreak, forKey: "statisticExpertBestWinStreak")
    UserDefaults.standard.set(statistics.statisticExpertBestTime, forKey: "statisticExpertBestTime")
    UserDefaults.standard.set(statistics.statisticExpertAverageTime, forKey: "statisticExpertAverageTime")
    // ----------------
    
    UserDefaults.standard.synchronize()
}

func loadData() {
    if let array = UserDefaults.standard.array(forKey: "userArrayKey") as? [[String]] {
        mainArray.testArray = array
        mainArray.oldCancelArray = UserDefaults.standard.array(forKey: "userOldArrayKey") as? [[String]] ?? [[]]
    } else {
        mainArray.testArray = mainArray.defaultArray
    }
    
    if let endArray = UserDefaults.standard.array(forKey: "endArray") as? [Int] {
        mainArray.endArray = endArray
    }
    
    if let timeArray = UserDefaults.standard.array(forKey: "timeArray") as? [Int] {
        variables.timeArray = timeArray
    }
    
    
    variables.savedGame = UserDefaults.standard.bool(forKey: "SaveGame")
    variables.countSec = UserDefaults.standard.integer(forKey: "countSec")
    variables.countMin = UserDefaults.standard.integer(forKey: "countMin")
    variables.levelGame = UserDefaults.standard.integer(forKey: "levelGame")
    
    
    
    let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
    if launchedBefore  {
        
        settings.sound = UserDefaults.standard.bool(forKey: "setting_sound")
        settings.autolockScreen = UserDefaults.standard.bool(forKey: "setting_autolockScreen")
        settings.timer = UserDefaults.standard.bool(forKey: "setting_timer")
        settings.errorLimit = UserDefaults.standard.bool(forKey: "setting_errorLimit")
        settings.autocheckError = UserDefaults.standard.bool(forKey: "setting_autocheckError")
        settings.hideUsedNumbers = UserDefaults.standard.bool(forKey: "setting_hideUsedNumbers")
        settings.selectRepeating = UserDefaults.standard.bool(forKey: "setting_selectRepeating")
        settings.selectedArea = UserDefaults.standard.bool(forKey: "setting_selectedArea")
        settings.selectedSameNumber = UserDefaults.standard.bool(forKey: "setting_selectedSameNumber")
        settings.autoDeleteNote = UserDefaults.standard.bool(forKey: "setting_autoDeleteNote")
        variables.customGameNumber = UserDefaults.standard.integer(forKey: "customGameNumber")
        store.countGame = UserDefaults.standard.integer(forKey: "countGame")

        
    } else {
        UserDefaults.standard.set(true, forKey: "launchedBefore")
    }
    
    
    statistics.statisticsEasyGamesPlayed = UserDefaults.standard.integer(forKey: "statisticsEasyGamesPlayed")
    statistics.statisticEasyGamesCompleted = UserDefaults.standard.integer(forKey: "statisticEasyGamesCompleted")
    statistics.statisticEasyWinRate = UserDefaults.standard.integer(forKey: "statisticEasyWinRate")
    statistics.statisticEasyBestWinStreak = UserDefaults.standard.integer(forKey: "statisticEasyBestWinStreak")
    statistics.statisticEasyBestTime = UserDefaults.standard.integer(forKey: "statisticEasyBestTime")
    statistics.statisticEasyAverageTime = UserDefaults.standard.integer(forKey: "statisticEasyAverageTime")

    statistics.statisticsAverageGamesPlayed = UserDefaults.standard.integer(forKey: "statisticsAverageGamesPlayed")
    statistics.statisticAverageGamesCompleted = UserDefaults.standard.integer(forKey: "statisticAverageGamesCompleted")
    statistics.statisticAverageWinRate = UserDefaults.standard.integer(forKey: "statisticAverageWinRate")
    statistics.statisticAverageBestWinStreak = UserDefaults.standard.integer(forKey: "statisticAverageBestWinStreak")
    statistics.statisticAverageBestTime = UserDefaults.standard.integer(forKey: "statisticAverageBestTime")
    statistics.statisticAverageAverageTime = UserDefaults.standard.integer(forKey: "statisticAverageAverageTime")

    statistics.statisticsHardGamesPlayed = UserDefaults.standard.integer(forKey: "statisticsHardGamesPlayed")
    statistics.statisticHardGamesCompleted = UserDefaults.standard.integer(forKey: "statisticHardGamesCompleted")
    statistics.statisticHardWinRate = UserDefaults.standard.integer(forKey: "statisticHardWinRate")
    statistics.statisticHardBestWinStreak = UserDefaults.standard.integer(forKey: "statisticHardBestWinStreak")
    statistics.statisticHardBestTime = UserDefaults.standard.integer(forKey: "statisticHardBestTime")
    statistics.statisticHardAverageTime = UserDefaults.standard.integer(forKey: "statisticHardAverageTime")

    statistics.statisticsExpertGamesPlayed = UserDefaults.standard.integer(forKey: "statisticsExpertGamesPlayed")
    statistics.statisticExpertGamesCompleted = UserDefaults.standard.integer(forKey: "statisticExpertGamesCompleted")
    statistics.statisticExpertWinRate = UserDefaults.standard.integer(forKey: "statisticExpertWinRate")
    statistics.statisticExpertBestWinStreak = UserDefaults.standard.integer(forKey: "statisticExpertBestWinStreak")
    statistics.statisticExpertBestTime = UserDefaults.standard.integer(forKey: "statisticExpertBestTime")
    statistics.statisticExpertAverageTime = UserDefaults.standard.integer(forKey: "statisticExpertAverageTime")


    
    
    UserDefaults.standard.synchronize()

    
    // ----------------


}



