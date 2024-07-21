//
//  WindyAnimation.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 21.07.2024.
//

import UIKit

final class WindyAnimation: WeatherAnimationProtocol {

    func createWeatherAnimationLayers(bounds: CGRect) -> [CALayer] {
        let layer = createLayer(with: bounds)
        addLayerAnimation(for: layer, with: bounds)
        return [layer]
    }

    private func createLayer(with bounds: CGRect) -> CAEmitterLayer {
        let layer = CAEmitterLayer()

        layer.frame = bounds
        layer.emitterShape = .line
        layer.emitterPosition = CGPoint(x: bounds.midX, y: bounds.midY)
        layer.emitterSize = CGSize(width: bounds.width, height: 1)
        layer.emitterMode = .outline

        let layerCell = createCell()
        layer.emitterCells = [layerCell]
        return layer
    }


    private func createCell() -> CAEmitterCell {
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
        return cell
    }

    private func addLayerAnimation(for layer: CALayer, with bounds: CGRect) {
        let animation = CAKeyframeAnimation(keyPath: "emitterPosition")
        animation.path = createPath(bounds: bounds).cgPath
        animation.duration = 4.0
        animation.repeatCount = .infinity
        animation.calculationMode = .paced
        layer.add(animation, forKey: "windyAnimation")
    }

    private func createPath(bounds: CGRect) -> UIBezierPath {
        let path = UIBezierPath()
        path.addArc(
            withCenter: CGPoint(x: bounds.midX, y: bounds.midY),
            radius: bounds.width / 2,
            startAngle: 0,
            endAngle: CGFloat.pi * 2,
            clockwise: true
        )
        return path
    }
}
