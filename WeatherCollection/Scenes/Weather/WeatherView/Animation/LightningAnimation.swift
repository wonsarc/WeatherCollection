//
//  LightningAnimation.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 19.07.2024.
//

import UIKit

final class LightningAnimation: WeatherAnimationProtocol {

    // MARK: - Public Properties

    var layers: [CALayer] = []

    // MARK: - Public Methods

    func apply(to view: WeatherView) {
        view.clearWeatherLayers()

        WeatherAnimation().setupBackgroundColor(to: view, weather: .lightning)


        let lightningLayer = createLightningAnimation(bounds: view.bounds)
        view.layer.addSublayer(lightningLayer)
        view.weatherLayers.append(lightningLayer)

    }

    // MARK: - Private Methods

    private func createLightningAnimation(bounds: CGRect) -> CALayer {
        let lightningLayer = CALayer()
        lightningLayer.frame = bounds

        let shapeLayer = createShapeLayer(bounds: bounds)
        lightningLayer.addSublayer(shapeLayer)

        let flashLayer = createFlashLayer(bounds: bounds)
        lightningLayer.addSublayer(flashLayer)

        animateLightning(shapeLayer: shapeLayer, flashLayer: flashLayer, bounds: bounds)

        return lightningLayer
    }

    private func createShapeLayer(bounds: CGRect) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 2.0
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        shapeLayer.lineJoin = .round

        return shapeLayer
    }

    private func createFlashLayer(bounds: CGRect) -> CALayer {
        let flashLayer = CALayer()
        flashLayer.backgroundColor = UIColor.white.cgColor
        flashLayer.frame = bounds
        flashLayer.opacity = 0

        return flashLayer
    }

    private func animateLightning(shapeLayer: CAShapeLayer, flashLayer: CALayer, bounds: CGRect) {

        func createRandomLightningPath(in bounds: CGRect) -> UIBezierPath {
            let path = UIBezierPath()
            let numberOfSegments = Int.random(in: 5...7)

            path.move(to: CGPoint(x: bounds.width * 0.5, y: 0))

            for i in 1..<numberOfSegments {
                let x = CGFloat.random(in: 0...bounds.width)
                let y = CGFloat(i) / CGFloat(numberOfSegments) * bounds.height
                path.addLine(to: CGPoint(x: x, y: y))
            }

            path.addLine(to: CGPoint(x: bounds.width * 0.5, y: bounds.height))
            return path
        }

        func animateLightning() {
            let path = createRandomLightningPath(in: bounds)
            shapeLayer.path = path.cgPath

            let strokeAnimation = CABasicAnimation(keyPath: "strokeEnd")
            strokeAnimation.fromValue = 0
            strokeAnimation.toValue = 1
            strokeAnimation.duration = 0.3
            strokeAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            strokeAnimation.fillMode = .forwards
            strokeAnimation.isRemovedOnCompletion = false

            let flashAnimation = CABasicAnimation(keyPath: "opacity")
            flashAnimation.fromValue = 0
            flashAnimation.toValue = 0.8
            flashAnimation.duration = 0.1
            flashAnimation.autoreverses = true
            flashAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            flashAnimation.beginTime = CACurrentMediaTime() + 0.3

            let fadeOutAnimation = CABasicAnimation(keyPath: "opacity")
            fadeOutAnimation.fromValue = 0.8
            fadeOutAnimation.toValue = 0
            fadeOutAnimation.duration = 0.3
            fadeOutAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            fadeOutAnimation.beginTime = CACurrentMediaTime() + 0.4
            fadeOutAnimation.fillMode = .forwards
            fadeOutAnimation.isRemovedOnCompletion = false

            CATransaction.begin()
            CATransaction.setCompletionBlock {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    animateLightning()
                }
            }

            shapeLayer.add(strokeAnimation, forKey: "strokeEndAnimation")
            flashLayer.add(flashAnimation, forKey: "flashAnimation")
            shapeLayer.add(fadeOutAnimation, forKey: "fadeOutAnimation")

            CATransaction.commit()
        }

        animateLightning()
    }
}
