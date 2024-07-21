//
//  LightningAnimation.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 21.07.2024.
//

import UIKit

final class LightningAnimation: WeatherAnimationProtocol {

    func createWeatherAnimationLayers(bounds: CGRect) -> [CALayer] {
        let shapeLayer = createShapeLayer(bounds: bounds)
        let flashLayer = createFlashLayer(bounds: bounds)

        addAnimation(to: shapeLayer, fromVal: 0.8, toVal: 0, duration: 0.3, delay: 0.4, autoreverses: false)
        addAnimation(to: flashLayer, fromVal: 0, toVal: 0.8, duration: 0.1, delay: 0.3, autoreverses: true)

        return [shapeLayer, flashLayer]
    }

    private func createFlashLayer(bounds: CGRect) -> CALayer {
        let layer = CALayer()
        layer.backgroundColor = UIColor.white.cgColor
        layer.frame = bounds
        layer.opacity = 0
        return layer
    }

    private func createShapeLayer(bounds: CGRect) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 2.0
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
        shapeLayer.lineJoin = .round
        shapeLayer.path = createPath(in: bounds).cgPath
        return shapeLayer
    }

    private func addAnimation(to layer: CALayer, fromVal: Float, toVal: Float, duration: CFTimeInterval, delay: CFTimeInterval, autoreverses: Bool) {
        let animation = createAnimation(fromVal: fromVal, toVal: toVal, duration: duration, delay: delay, autoreverses: autoreverses)
        let group = createAnimationGroup(with: [animation], duration: delay + duration * (autoreverses ? 2 : 1) + 3.0)
        layer.add(group, forKey: "lightningAnimation")
    }

    private func createAnimation(fromVal: Float, toVal: Float, duration: CFTimeInterval, delay: CFTimeInterval, autoreverses: Bool) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = fromVal
        animation.toValue = toVal
        animation.duration = duration
        animation.autoreverses = autoreverses
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.beginTime = delay
        animation.fillMode = .forwards
        return animation
    }

    private func createAnimationGroup(with animations: [CAAnimation], duration: CFTimeInterval) -> CAAnimationGroup {
        let group = CAAnimationGroup()
        group.animations = animations
        group.duration = duration
        group.isRemovedOnCompletion = false
        group.repeatCount = .greatestFiniteMagnitude
        return group
    }

    private func createPath(in bounds: CGRect) -> UIBezierPath {
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
}
