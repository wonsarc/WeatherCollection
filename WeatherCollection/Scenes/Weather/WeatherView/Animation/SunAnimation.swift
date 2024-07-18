//
//  SunAnimation.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 18.07.2024.
//

import UIKit

final class SunAnimation: WeatherAnimationProtocol {

    // MARK: - Public Properties

    var layers: [CALayer] = []

    // MARK: - Public Methods

    func apply(to view: WeatherView) {
        view.clearWeatherLayers()
        WeatherAnimation().setupBackgroundColor(to: view, weather: .sunny)

        let sunLayer = createSunLayer(bounds: view.bounds)
        view.layer.addSublayer(sunLayer)
        view.weatherLayers.append(sunLayer)

        animatePositionSunLayer(sunLayer, bounds: view.bounds)
        animateSunCircleLayer(sunLayer, bounds: view.bounds)
        blinkSunLayer(sunLayer)
    }

    // MARK: - Private Methods

    private func createSunLayer(bounds: CGRect) -> CALayer {
        let sunLayer = CALayer()
        sunLayer.backgroundColor = UIColor(hex: 0xFAC555).cgColor
        sunLayer.bounds = CGRect(
            x: 0,
            y: 0,
            width: 240,
            height: 240
        )

        sunLayer.cornerRadius = sunLayer.bounds.height / 2
        sunLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)
        return sunLayer
    }
    private func animateSunCircleLayer(_ circleLayer: CALayer, bounds: CGRect) {

        let sizeAnimation = CASpringAnimation(keyPath: "bounds.size")
        sizeAnimation.fromValue = NSValue(cgSize: circleLayer.bounds.size)
        sizeAnimation.toValue = NSValue(cgSize: CGSize(width: circleLayer.bounds.width * 0.9, height: circleLayer.bounds.height * 0.9))
        sizeAnimation.damping = 5.0
        sizeAnimation.stiffness = 100.0
        sizeAnimation.mass = 1.0
        sizeAnimation.initialVelocity = 0.0
        sizeAnimation.duration = sizeAnimation.settlingDuration
        sizeAnimation.autoreverses = true
        sizeAnimation.repeatCount = .infinity

        let cornerRadiusAnimation = CASpringAnimation(keyPath: "cornerRadius")
        cornerRadiusAnimation.fromValue = circleLayer.bounds.height / 2
        cornerRadiusAnimation.toValue = (circleLayer.bounds.height * 0.9) / 2
        cornerRadiusAnimation.damping = 5.0
        cornerRadiusAnimation.stiffness = 100.0
        cornerRadiusAnimation.mass = 1.0
        cornerRadiusAnimation.initialVelocity = 0.0
        cornerRadiusAnimation.duration = cornerRadiusAnimation.settlingDuration
        cornerRadiusAnimation.autoreverses = true
        cornerRadiusAnimation.repeatCount = .infinity

        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [sizeAnimation, cornerRadiusAnimation]
        animationGroup.duration = sizeAnimation.settlingDuration
        animationGroup.autoreverses = true
        animationGroup.repeatCount = .infinity

        circleLayer.cornerRadius = circleLayer.bounds.height / 2
        circleLayer.add(animationGroup, forKey: "sunAnimation")
    }




    private func animatePositionSunLayer(_ sunLayer: CALayer, bounds: CGRect) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: bounds.midX, y: bounds.maxY)
        animation.toValue = CGPoint(x: bounds.midX, y: bounds.midY)
        animation.duration = 3.0
        animation.isRemovedOnCompletion = false
        sunLayer.add(animation, forKey: "positionAnimation")
    }

    private func blinkSunLayer(_ sunLayer: CALayer) {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1.0
        animation.toValue = 0.6
        animation.duration = 2
        animation.autoreverses = true
        animation.repeatCount = .infinity
        sunLayer.add(animation, forKey: "opacityAnimation")
    }
}
