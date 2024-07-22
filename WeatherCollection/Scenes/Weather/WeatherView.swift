//
//  WeatherView.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 21.07.2024.
//

import UIKit

protocol WeatherViewProtocol: UIView {
    func addSublayer(_ layer: CALayer)
    func removeAllSublayers()
}

final class WeatherView: UIView, WeatherViewProtocol {

    func addSublayer(_ layer: CALayer) {
        self.layer.addSublayer(layer)
    }

    func removeAllSublayers() {
        layer.sublayers?.removeAll()
    }
}
