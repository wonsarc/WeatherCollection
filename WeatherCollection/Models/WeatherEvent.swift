//
//  WeatherEvent.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 16.07.2024.
//

import Foundation

struct WeatherEvent: Hashable {
    let id = UUID()
    let type: WeatherType
}
