//
//  SunAnimation.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 21.07.2024.
//

import UIKit

final class SunAnimation: WeatherAnimationProtocol {
    
    func createWeatherAnimationLayers(bounds: CGRect) -> [CALayer] {
        let layer = createLayer(with: bounds)
        addLayerAnimation(for: layer, with: bounds)        
        return [layer]
    }
    
    private func createLayer(with bounds: CGRect) -> CALayer {
        let layer = CALayer()
        layer.backgroundColor = UIColor.sunColor.cgColor
        layer.bounds = CGRect(
            x: 0,
            y: 0,
            width: 240,
            height: 240
        )
        
        layer.cornerRadius = layer.bounds.height / 2
        layer.position = CGPoint(x: bounds.midX, y: bounds.midY)
        return layer
    }
    
    private func addLayerAnimation(for layer: CALayer, with bounds: CGRect) {
        layer.add(animateSunCircleLayer(layer, bounds), forKey: "sunAnimation")
        layer.add(animatePositionSunLayer(layer,bounds),forKey: "positionAnimation")
        layer.add(blinkSunLayer(layer), forKey: "opacityAnimation")
    }
    
    private func animateSunCircleLayer(_ layer: CALayer, _ bounds: CGRect) -> CAAnimation {
        let sizeAnimation = CASpringAnimation(keyPath: "bounds.size")
        sizeAnimation.fromValue = NSValue(cgSize: layer.bounds.size)
        sizeAnimation.toValue = NSValue(cgSize: CGSize(width: layer.bounds.width * 0.9, height: layer.bounds.height * 0.9))
        sizeAnimation.damping = 5.0
        sizeAnimation.stiffness = 100.0
        sizeAnimation.mass = 1.0
        sizeAnimation.initialVelocity = 0.0
        sizeAnimation.duration = sizeAnimation.settlingDuration
        sizeAnimation.autoreverses = true
        sizeAnimation.repeatCount = .infinity
        
        let cornerRadiusAnimation = CASpringAnimation(keyPath: "cornerRadius")
        cornerRadiusAnimation.fromValue = layer.bounds.height / 2
        cornerRadiusAnimation.toValue = (layer.bounds.height * 0.9) / 2
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
        
        layer.cornerRadius = layer.bounds.height / 2
        
        return animationGroup
    }
    
    private func animatePositionSunLayer(_ sunLayer: CALayer, _ bounds: CGRect) -> CAAnimation {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: bounds.midX, y: bounds.maxY)
        animation.toValue = CGPoint(x: bounds.midX, y: bounds.midY)
        animation.duration = 3.0
        animation.isRemovedOnCompletion = false
        return animation
        
    }
    
    private func blinkSunLayer(_ sunLayer: CALayer) -> CAAnimation {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1.0
        animation.toValue = 0.6
        animation.duration = 2
        animation.autoreverses = true
        animation.repeatCount = .infinity
        return animation
    }
}
