//
//  FogAnimation.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 17.07.2024.
//

import UIKit

final class FogAnimation: WeatherAnimationProtocol {

    // MARK: - Public Properties

    var layers: [CALayer] = []

    // MARK: - Private Properties

    private let fogColor = UIColor(white: 1.0, alpha: 0.3)

    // MARK: - Public Methods

    func apply(to view: WeatherView) {
        view.clearWeatherLayers()

        WeatherAnimation().setupBackgroundColor(to: view, weather: .foggy)

        let numberOfLayers = 20
        for _ in 0..<numberOfLayers {
            let fogLayer = createFogLayer(bounds: view.bounds)
            view.layer.addSublayer(fogLayer)
            view.weatherLayers.append(fogLayer)
        }

        view.weatherLayers.forEach { layer in
            layer.add(createFogLayerAnimation(for: layer), forKey: "fogAnimation")
        }
    }

    // MARK: - Private Methods

    private func createFogLayer(bounds: CGRect) -> CALayer {
        let fogLayer = CALayer()
        fogLayer.backgroundColor = fogColor.cgColor
        let layerWidth = bounds.width * CGFloat.random(in: 1.2...1.5)
        let layerHeight = bounds.height * CGFloat.random(in: 0.1...0.2)
        let startX = CGFloat.random(in: -layerWidth/2...bounds.width-layerWidth/2)
        let startY = CGFloat.random(in: -layerHeight/2...bounds.height-layerHeight/2)
        fogLayer.frame = CGRect(x: startX, y: startY, width: layerWidth, height: layerHeight)
        fogLayer.cornerRadius = 32
        return fogLayer
    }

    private func createFogLayerAnimation(for layer: CALayer) -> CABasicAnimation {
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
        return animation
    }
}
