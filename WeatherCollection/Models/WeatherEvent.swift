//
//  WeatherEvent.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 16.07.2024.
//

import UIKit

enum WeatherType {
    case fog
    case clouds
}

struct WeatherEvent: Hashable {
    let id = UUID()
    let type: WeatherType
    let title: String
    let backgroundColor: UIColor
}
