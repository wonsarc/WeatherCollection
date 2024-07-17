//
//  WeatherAnimation.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 17.07.2024.
//

import UIKit

protocol WeatherAnimation {

    var layers: [CALayer] { get }

    func apply(to view: WeatherView)
}
