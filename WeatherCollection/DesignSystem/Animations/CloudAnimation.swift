//
//  CloudAnimation.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 21.07.2024.
//

import UIKit

final class CloudAnimation: WeatherAnimationProtocol {

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
        let cloudImage = UIImage(named: "cloudy")
        let layer = CALayer()
        layer.contents = cloudImage?.cgImage
        layer.bounds = CGRect(
            x: 0,
            y: 0,
            width: Int.random(in: 50...70),
            height: Int.random(in: 25...70)
        )
        layer.position = CGPoint(x: -50, y: CGFloat.random(in: 0...bounds.height - 100))
        return layer
    }
    
    private func addLayerAnimation(for layer: CALayer, with bounds: CGRect) {
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = -layer.bounds.width / 2
        animation.toValue = bounds.width + layer.bounds.width / 2
        animation.duration = Double.random(in: 5.0...15.0)
        animation.repeatCount = .infinity
        layer.add(animation, forKey: "cloudAnimation")
    }
}
