//
//  WeatherAnimation.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 21.07.2024.
//

import UIKit

protocol WeatherAnimationProtocol {
    func createWeatherAnimationLayers(bounds: CGRect) -> [CALayer]
//    func createLayer(with bounds: CGRect) -> CALayer
//    func createLayerAnimation(for layer: CALayer)
}
