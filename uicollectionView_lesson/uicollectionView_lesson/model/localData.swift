import Foundation

func saveData() {
    UserDefaults.standard.set(mainArray.testArray, forKey: "userArrayKey")
    UserDefaults.standard.set(variables.savedGame, forKey: "SaveGame")

    UserDefaults.standard.synchronize()
}

func loadData() {
    if let array = UserDefaults.standard.array(forKey: "userArrayKey") as? [[String]] {
        mainArray.testArray = array
    } else {
        mainArray.testArray = mainArray.defaultArray
    }
    
    variables.savedGame = UserDefaults.standard.bool(forKey: "SaveGame")
}
