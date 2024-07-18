//
//  WeatherView.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 17.07.2024.
//

import UIKit

final class WeatherView: UIView {

    // MARK: - Public Properties

    var weatherLayers: [CALayer] = []

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func clearWeatherLayers() {
        for layer in weatherLayers {
            layer.removeFromSuperlayer()
        }
        weatherLayers.removeAll()
    }
}
