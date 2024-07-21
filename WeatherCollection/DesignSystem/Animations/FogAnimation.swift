//
//  FogAnimation.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 21.07.2024.
//

import UIKit

final class FogAnimation: WeatherAnimationProtocol {

    func createWeatherAnimationLayers(bounds: CGRect) -> [CALayer] {
        var layers: [CALayer] = []
        let numberOfLayers = 20

        for _ in 0..<numberOfLayers {
            let layer = createLayer(with: bounds)
            addLayerAnimation(for: layer)
            layers.append(layer)
        }

        return layers
    }

    private func createLayer(with bounds: CGRect) -> CALayer {
        let layer = CALayer()
        layer.backgroundColor = UIColor(white: 1.0, alpha: 0.3).cgColor

        let layerWidth = bounds.width * CGFloat.random(in: 1.2...1.5)
        let layerHeight = bounds.height * CGFloat.random(in: 0.1...0.2)

        let startX = CGFloat.random(in: -layerWidth/2...bounds.width-layerWidth/2)
        let startY = CGFloat.random(in: -layerHeight/2...bounds.height-layerHeight/2)

        layer.frame = CGRect(x: startX, y: startY, width: layerWidth, height: layerHeight)
        layer.cornerRadius = 32

        return layer
    }

    private func addLayerAnimation(for layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = NSValue(cgPoint: layer.position)

        animation.toValue = NSValue(
            cgPoint: CGPoint(
                x: layer.position.x + CGFloat.random(in: -20...20),
                y: layer.position.y + CGFloat.random(in: -20...20)
            )
        )

        animation.duration = Double.random(in: 1.0...5.0)
        animation.repeatCount = .infinity
        animation.autoreverses = true

        layer.add(animation, forKey: "fogAnimation")
    }
}
