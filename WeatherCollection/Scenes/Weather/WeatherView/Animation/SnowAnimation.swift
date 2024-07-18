//
//  SnowAnimation.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 18.07.2024.
//

import UIKit

final class SnowAnimation: WeatherAnimationProtocol {

    // MARK: - Public Properties

    var layers: [CALayer] = []

    // MARK: - Public Methods

    func apply(to view: WeatherView) {
        view.clearWeatherLayers()

        WeatherAnimation().setupBackgroundColor(to: view, weather: .snow)

        let largeSnowdropCount = 10
        let smallSnowdropCount = 100

        for _ in 0..<largeSnowdropCount {
            let snowLayer = createSnowdropLayer(bounds: view.bounds, isSmall: false)
            view.layer.addSublayer(snowLayer)
            view.weatherLayers.append(snowLayer)
        }

        for _ in 0..<smallSnowdropCount {
            let smallsnowLayer = createSnowdropLayer(bounds: view.bounds, isSmall: true)
            view.layer.addSublayer(smallsnowLayer)
            view.weatherLayers.append(smallsnowLayer)
        }
    }

    // MARK: - Private Methods

    private func createSnowdropLayer(bounds: CGRect, isSmall: Bool) -> CALayer {
        let snowdropLayer = CALayer()
        snowdropLayer.backgroundColor = UIColor(.white).cgColor

        let layerSize = isSmall ? CGFloat.random(in: 1...2) : CGFloat.random(in: 3...5)
        let startX = CGFloat.random(in: 0...bounds.width - layerSize)
        let startY = CGFloat.random(in: 0...bounds.height)

        snowdropLayer.cornerRadius = layerSize / 2

        snowdropLayer.frame = CGRect(x: startX, y: startY, width: layerSize, height: layerSize)

        let animation = CABasicAnimation(keyPath: "position.y")
        animation.fromValue = -layerSize
        animation.toValue = bounds.height + layerSize
        animation.duration = isSmall ? Double.random(in: 0.5...2.0) : Double.random(in: 2.0...4.0)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.repeatCount = .infinity
        snowdropLayer.add(animation, forKey: "snowdropAnimation")

        return snowdropLayer
    }
}
