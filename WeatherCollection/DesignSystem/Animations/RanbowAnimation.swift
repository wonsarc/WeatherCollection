//
//  RanbowAnimation.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 21.07.2024.
//

import UIKit

final class RainbowAnimation: WeatherAnimationProtocol {

    func createWeatherAnimationLayers(bounds: CGRect) -> [CALayer] {
        let layer = createLayer(with: bounds)
        addLayerAnimation(for: layer, with: bounds)
        return [layer]
    }

    private func createLayer(with bounds: CGRect) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.frame = bounds
        layer.colors = [
            UIColor(hex: 0xFB6849).cgColor,
            UIColor(hex: 0xFFBC01).cgColor,
            UIColor(hex: 0xFEDA42).cgColor,
            UIColor(hex: 0x14D3A1).cgColor,
            UIColor(hex: 0x35E6E6).cgColor,
            UIColor(hex: 0x2195FF).cgColor,
            UIColor(hex: 0x9B61FF).cgColor
        ]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        return layer
    }

    private func addLayerAnimation(for layer: CAGradientLayer, with bounds: CGRect) {
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = layer.colors
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

        layer.add(animation, forKey: "rainbowAnimation")
    }
}
