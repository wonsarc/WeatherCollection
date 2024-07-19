//
//  RainbowAnimation.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 19.07.2024.
//

import UIKit

final class RainbowAnimation: WeatherAnimationProtocol {

    // MARK: - Public Properties

    var layers: [CALayer] = []

    // MARK: - Public Methods

    func apply(to view: WeatherView) {
        view.clearWeatherLayers()

            let rainbowLayer = createRainbowAnimation(bounds: view.bounds)
            view.layer.addSublayer(rainbowLayer)
            view.weatherLayers.append(rainbowLayer)

    }

    // MARK: - Private Methods

    private func createRainbowAnimation(bounds: CGRect) -> CAGradientLayer {
        let rainbowLayer = CAGradientLayer()
        rainbowLayer.frame = bounds
        rainbowLayer.colors = [
            UIColor(hex: 0xFB6849).cgColor,
            UIColor(hex: 0xFFBC01).cgColor,
            UIColor(hex: 0xFEDA42).cgColor,
            UIColor(hex: 0x14D3A1).cgColor,
            UIColor(hex: 0x35E6E6).cgColor,
            UIColor(hex: 0x2195FF).cgColor,
            UIColor(hex: 0x9B61FF).cgColor
        ]
        rainbowLayer.startPoint = CGPoint(x: 0, y: 0)
        rainbowLayer.endPoint = CGPoint(x: 1, y: 1)

        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = rainbowLayer.colors
        animation.toValue = [
            UIColor(hex: 0x9B61FF).cgColor,
            UIColor(hex: 0x2195FF).cgColor,
            UIColor(hex: 0x35E6E6).cgColor,
            UIColor(hex: 0x14D3A1).cgColor,
            UIColor(hex: 0xFEDA42).cgColor,
            UIColor(hex: 0xFFBC01).cgColor,
            UIColor(hex: 0xFB6849).cgColor
        ]
        animation.duration = 5.0
        animation.autoreverses = true
        animation.repeatCount = .infinity

        rainbowLayer.add(animation, forKey: "rainbowAnimation")

        return rainbowLayer
    }
}
