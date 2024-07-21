//
//  RainAnimation.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 21.07.2024.
//

import UIKit

final class RainAnimation: WeatherAnimationProtocol {

    func createWeatherAnimationLayers(bounds: CGRect) -> [CALayer] {
        var layers: [CALayer] = []
        let numberOfLayers = 10

        for _ in 0..<numberOfLayers {
            let layer = createLayer(with: bounds)
            addLayerAnimation(for: layer, with: bounds)
            layers.append(layer)
        }

        return layers
    }

    private func createLayer(with bounds: CGRect) -> CALayer {
        let layer = CALayer()
        layer.backgroundColor = UIColor(hex: 0xCBE1EE).cgColor

        let layerWidth = CGFloat.random(in: 1.0...3.0)
        let layerHeight = bounds.height
        let startX = CGFloat.random(in: 0...bounds.width - layerWidth)
        let startY = -layerHeight

        layer.cornerRadius = layerWidth / 2
        layer.frame = CGRect(x: startX, y: startY, width: layerWidth, height:  layerHeight)

        return layer
    }

    private func addLayerAnimation(for layer: CALayer, with bounds: CGRect) {
        let animation = CABasicAnimation(keyPath: "position.y")
        animation.fromValue = -layer.bounds.height
        animation.toValue = bounds.height + layer.bounds.height
        animation.duration = Double.random(in: 1.0...5.0)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.repeatCount = .infinity
        layer.add(animation, forKey: "rainAnimation")
    }
}
