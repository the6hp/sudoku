import Foundation

func help_all () {
    var a = variables.selectCell?[1]
    
    if a != nil {
        if mainArray.testArray[a!][0] == "" {
            mainArray.testArray[a!][0] = String(mainArray.endArray[a!])
            mainArray.testArray[a!][2] = "2"
        }
    }
}
