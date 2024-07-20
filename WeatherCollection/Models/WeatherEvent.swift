//
//  WeatherEvent.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 16.07.2024.
//

import UIKit

enum WeatherType {
    case sunny, cloudy, foggy, rain, lightning, windy, snow, rainbow
}

struct WeatherEvent: Hashable {
    let id = UUID()
    let type: WeatherType
}

extension WeatherType {

    var title: String {
        
        switch self {
        case .sunny: return NSLocalizedString("events.weather.sun", comment: "")
        case .cloudy: return NSLocalizedString("events.weather.cloud", comment: "")
        case .foggy: return NSLocalizedString("events.weather.fog", comment: "")
        case .rain: return NSLocalizedString("events.weather.rain", comment: "")
        case .snow: return NSLocalizedString("events.weather.snow", comment: "")
        case .lightning: return NSLocalizedString("events.weather.lightning", comment: "")
        case .windy: return NSLocalizedString("events.weather.windy", comment: "")
        case .rainbow: return NSLocalizedString("events.weather.rainbow", comment: "")
        }
    }
}
