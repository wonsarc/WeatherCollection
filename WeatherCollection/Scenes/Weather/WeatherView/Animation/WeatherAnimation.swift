//
//  WeatherAnimation.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 17.07.2024.
//

import UIKit

protocol WeatherAnimationProtocol {

    var layers: [CALayer] { get }

    func apply(to view: WeatherView)
}

final class WeatherAnimation {

    func setupBackgroundColor(to view: WeatherView, weather: WeatherType) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds

        switch weather {
        case .sunny:
            gradientLayer.colors = [
                UIColor(hex: 0xAFF3E9).cgColor,
                UIColor(hex: 0xFFF9ED).cgColor
            ]
        case .cloudy:
            gradientLayer.colors = [
                UIColor(hex: 0x8CC7FE).cgColor,
                UIColor(hex: 0xA9D4FF).cgColor
            ]
        case .rain, .foggy:
            gradientLayer.colors = [
                UIColor(hex: 0x5B8189).cgColor,
                UIColor(hex: 0xA5BABD).cgColor
            ]
        case .snow:
            gradientLayer.colors = [
                UIColor(hex: 0x2E63DC).cgColor,
                UIColor(hex: 0x431C71).cgColor
            ]
        }

        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)

        view.layer.sublayers?.filter { $0 is CAGradientLayer }.forEach { $0.removeFromSuperlayer() }

        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}


extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
