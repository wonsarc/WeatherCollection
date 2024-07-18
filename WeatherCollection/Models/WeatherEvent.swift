//
//  WeatherEvent.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 16.07.2024.
//

import UIKit

enum WeatherType {
    case foggy
    case cloudy
    case sunny
    case rain
    case snow
}

struct WeatherEvent: Hashable {
    let id = UUID()
    let type: WeatherType
    let title: String
}
