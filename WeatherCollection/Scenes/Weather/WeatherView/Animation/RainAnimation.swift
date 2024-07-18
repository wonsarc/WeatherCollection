//
//  RainAnimation.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 18.07.2024.
//

import UIKit

final class RainAnimation: WeatherAnimationProtocol {

    // MARK: - Public Properties

    var layers: [CALayer] = []

    // MARK: - Public Methods

    func apply(to view: WeatherView) {
        view.clearWeatherLayers()

        WeatherAnimation().setupBackgroundColor(to: view, weather: .rain)

        let largeRaindropCount = 10

        for _ in 0..<largeRaindropCount {
            let rainLayer = createRaindropLayer(bounds: view.bounds)
            view.layer.addSublayer(rainLayer)
            view.weatherLayers.append(rainLayer)
        }
    }

    // MARK: - Private Methods

    private func createRaindropLayer(bounds: CGRect) -> CALayer {
        let raindropLayer = CALayer()
        raindropLayer.backgroundColor = UIColor(hex: 0xCBE1EE).cgColor
        let layerWidth = CGFloat.random(in: 1.0...3.0)
        let layerHeight = bounds.height
        let startX = CGFloat.random(in: 0...bounds.width - layerWidth)
        let startY = -layerHeight

        raindropLayer.cornerRadius = layerWidth / 2

        raindropLayer.frame = CGRect(x: startX, y: startY, width: layerWidth, height:  layerHeight)

        let animation = CABasicAnimation(keyPath: "position.y")
        animation.fromValue = -layerHeight
        animation.toValue = bounds.height + layerHeight
        animation.duration = Double.random(in: 1.0...5.0)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.repeatCount = .infinity
        raindropLayer.add(animation, forKey: "raindropAnimation")

        return raindropLayer
    }
}
