//
//  WeatherEvent.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 16.07.2024.
//

import UIKit

enum WeatherType {
    case sunny
    case cloudy
    case foggy
    case rain
    case lightning
    case tornado
    case snow
    case rainbow
}

struct WeatherEvent: Hashable {
    let id = UUID()
    let type: WeatherType
    let title: String
}
