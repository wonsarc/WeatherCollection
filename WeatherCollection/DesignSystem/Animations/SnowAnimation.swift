//
//  SnowAnimation.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 21.07.2024.
//

import UIKit

final class SnowAnimation: WeatherAnimationProtocol {

    func createWeatherAnimationLayers(bounds: CGRect) -> [CALayer] {
        var layers: [CALayer] = []
        let largeSnowCount = 10
        let smallSnowCount = 100

        for _ in 0..<largeSnowCount {
            let layer = createLayer(with: bounds, isSmall: false)
            addLayerAnimation(for: layer, with: bounds, isSmall: false)
            layers.append(layer)
        }

        for _ in 0..<smallSnowCount {
            let layer = createLayer(with: bounds, isSmall: true)
            addLayerAnimation(for: layer, with: bounds, isSmall: true)
            layers.append(layer)
        }

        return layers
    }

    private func createLayer(with bounds: CGRect, isSmall: Bool) -> CALayer {
        let layer = CALayer()
        layer.backgroundColor = UIColor(.white).cgColor

        let layerSize = isSmall ? CGFloat.random(in: 1...2) : CGFloat.random(in: 3...5)
        let startX = CGFloat.random(in: 0...bounds.width - layerSize)
        let startY = CGFloat.random(in: 0...bounds.height)

        layer.cornerRadius = layerSize / 2

        layer.frame = CGRect(x: startX, y: startY, width: layerSize, height: layerSize)

        return layer
    }

    private func addLayerAnimation(for layer: CALayer, with bounds: CGRect, isSmall: Bool) {
        let animation = CABasicAnimation(keyPath: "position.y")
        animation.fromValue = -layer.frame.width
        animation.toValue = bounds.height + layer.frame.width
        animation.duration = isSmall ? Double.random(in: 0.5...2.0) : Double.random(in: 2.0...4.0)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.repeatCount = .infinity
        layer.add(animation, forKey: "snowAnimation")
    }
}
