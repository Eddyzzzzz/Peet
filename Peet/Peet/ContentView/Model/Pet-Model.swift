//
//  Pet-Model.swift
//  Peet
//
//  Created by Eddy on 12/28/22.
//

import Foundation

struct Pet: Codable {
    var name: String
    var birthday = Date()
    var lastMeal: Date
    var lastDrink: Date
    
    var age: Int {
        let timeSince = calcTimeSince(data: birthday)
        return timeSince
    }
    
    var happy: String {
//        hunger == "RAVENOUS" || thirst == "Thirsty... ne..need... water..." ? "💀" : "😎"
        
        if (hunger == "RAVENOUS" || thirst == "Thirsty... ne..need... water...") {
            return "💀"
        }

        else if (hunger == "Hungry-ing" || thirst == "Getting thirsty"){
            return "😐"
        }

        else {
            return "😎"
        }
    }
    
    var hunger: String {
        let timeSince = calcTimeSince(data: lastMeal)
        var string = "Hungry"
        
        switch timeSince {
        case 0..<15: string = "FULLLLL"
        case 60..<120: string = "Hungry-ing"
        case 120...: string = "RAVENOUS"
        default: string = "Idk"
        }
        return string
    }
    
    var thirst: String {
        let timeSince = calcTimeSince(data: lastDrink)
        var string = "Thirsty"
        
        switch timeSince {
        case 0..<30: string = "Not thirsty at all"
        case 30..<90: string = "Getting thirsty"
        case 90...: string = "Thirsty... ne..need... water..."
        default: string = "Idk"
        }
        
        return string
    }
    
}
