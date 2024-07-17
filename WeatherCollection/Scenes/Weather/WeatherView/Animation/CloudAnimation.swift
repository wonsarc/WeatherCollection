//
//  CloudAnimation.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 17.07.2024.
//

import UIKit

final class CloudAnimation: WeatherAnimation {

    // MARK: - Public Properties

    var layers: [CALayer] = []

    // MARK: - Private Properties

    private let cloudImage = UIImage(named: "cloudy")

    // MARK: - Public Methods

    func apply(to view: WeatherView) {
        view.clearWeatherLayers()

        let numberOfLayers = 10
        for _ in 0..<numberOfLayers {
            let cloudLayer = createCloudLayer(bounds: view.bounds)
            view.layer.addSublayer(cloudLayer)
            view.weatherLayers.append(cloudLayer)
            cloudLayer.add(createCloudLayerAnimation(for: cloudLayer, bounds: view.bounds), forKey: "cloudAnimation")
        }
    }


    // MARK: - Private Methods

    private func createCloudLayer(bounds: CGRect) -> CALayer {
        let cloudLayer = CALayer()
        cloudLayer.contents = cloudImage?.cgImage
        cloudLayer.bounds = CGRect(
            x: 0,
            y: 0,
            width: Int.random(in: 50...70),
            height: Int.random(in: 25...70)
        )
        cloudLayer.position = CGPoint(x: -50, y: CGFloat.random(in: 0...bounds.height - 100))
        return cloudLayer
    }

    private func createCloudLayerAnimation(for layer: CALayer, bounds: CGRect) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.fromValue = -layer.bounds.width / 2
        animation.toValue = bounds.width + layer.bounds.width / 2
        animation.duration = Double.random(in: 5.0...15.0)
        animation.repeatCount = .infinity
        return animation
    }
}
