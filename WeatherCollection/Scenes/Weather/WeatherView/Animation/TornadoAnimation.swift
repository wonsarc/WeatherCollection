//
//  TornadoAnimation.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 19.07.2024.
//

import UIKit

final class TornadoAnimation: WeatherAnimationProtocol {

    // MARK: - Public Properties

    var layers: [CALayer] = []

    // MARK: - Public Methods

    func apply(to view: WeatherView) {
        view.clearWeatherLayers()

        WeatherAnimation().setupBackgroundColor(to: view, weather: .lightning)

        let tornadoLayer = createTornadoAnimation(bounds: view.bounds)
        view.layer.addSublayer(tornadoLayer)
        view.weatherLayers.append(tornadoLayer)

    }

    // MARK: - Private Methods

    private func createTornadoAnimation(bounds: CGRect) -> CAEmitterLayer {
        let emitterLayer = CAEmitterLayer()
        emitterLayer.frame = bounds

        emitterLayer.emitterShape = .line
        emitterLayer.emitterPosition = CGPoint(x: bounds.midX, y: bounds.midY)
        emitterLayer.emitterSize = CGSize(width: bounds.width, height: 1)
        emitterLayer.emitterMode = .outline

        let cell = CAEmitterCell()
        cell.birthRate = 50
        cell.lifetime = 2.0
        cell.lifetimeRange = 1.0
        cell.color = UIColor.white.cgColor
        cell.contents = UIImage(systemName: "leaf")?.cgImage
        cell.velocity = 150
        cell.velocityRange = 75
        cell.emissionLongitude = CGFloat.pi * 2
        cell.emissionRange = CGFloat.pi
        cell.scale = 0.2
        cell.scaleRange = 0.3
        cell.alphaSpeed = -0.3
        cell.spin = 1.0
        cell.spinRange = 1.5

        emitterLayer.emitterCells = [cell]

        let rotationAnimation = CAKeyframeAnimation(keyPath: "emitterPosition")
        let animationPath = UIBezierPath()
        animationPath.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: bounds.width / 2, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)

        rotationAnimation.path = animationPath.cgPath
        rotationAnimation.duration = 4.0
        rotationAnimation.repeatCount = .infinity
        rotationAnimation.calculationMode = .paced
        emitterLayer.add(rotationAnimation, forKey: "emitterPosition")

        return emitterLayer
    }
}

