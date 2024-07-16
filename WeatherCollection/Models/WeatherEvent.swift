//
//  WeatherEvent.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 16.07.2024.
//

import UIKit

struct WeatherEvent: Hashable {

    let id = UUID()
    let title: String
    let image: UIImage
    let backgroundColor: UIColor
}
