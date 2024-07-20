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

        let colors = UIColor.WeatherColors(for: weather)
        gradientLayer.colors = [colors.topColor, colors.bottomColor]

        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)

        view.layer.sublayers?.filter { $0 is CAGradientLayer }.forEach { $0.removeFromSuperlayer() }
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
