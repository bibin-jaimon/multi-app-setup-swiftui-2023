//
//  FAStrings.swift
//  Fructus
//
//  Created by Bibin Jaimon on 04/05/23.
//

import Foundation

struct AppStorageKeys {
    static let isOnboarded = "isOnboarded"
}

struct ImageNames {
    static let arrowRightCircle = "arrow.right.circle"
    static let infoCircle = "info.circle"
    static let xMark = "xmark"
    static let logo = "logo"
    static let paintbrush = "paintbrush"
    static let appsIphone = "apps.iphone"
    static let arrowUpRightSquare = "arrow.up.right.square"
    static let sliderHorizontal = "slider.horizontal.3"
}

struct FAStrings {
    static let start = "Start"
    static let fructus = "Fructus"
    static let about = "Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more."
    static let customization = "Customization"
    static let resetDescription = "If you wish you can restart the application by toogle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again"
    static let onboarded = "Onboarded"
    static let showOnboard = "Show Onboard"
    static let application = "Applicaton"
    static let settings = "Settings"
    static let nutritionalValue = "Nutritional value per 100g"
    static let contentSource = "Content Source"
    static let wikipedia = "Wikipedia"
    static let learnMoreAbout: (String) -> String = { title in
        return "learn more about \(title)"
    }
    
    static let fruits = "Fruits"
}

struct FALinks {
    static let wikipedia = "https://www.wikipedia.com"
}
