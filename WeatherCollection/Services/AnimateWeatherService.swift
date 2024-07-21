//
//  AnimateWeatherService.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 21.07.2024.
//

import UIKit

protocol AnimateWeatherServiceProtocol {
    func changeAnimation(to view: WeatherViewProtocol, type: WeatherType)
}

final class AnimateWeatherService: AnimateWeatherServiceProtocol {

    // MARK: - Private Properties

    private var bounds: CGRect?

    // MARK: - Public Methods

    func changeAnimation(to view: WeatherViewProtocol, type: WeatherType) {
        bounds = view.bounds

        let layers = fetchWeatherAnimationLayers(for: type)
        guard !layers.isEmpty else { return }

        view.removeAllSublayers()

        setupBackgroundColor(to: view, weather: type)

        for layer in layers {
            view.addSublayer(layer)
        }
    }

    // MARK: - Private Methods

    private func fetchWeatherAnimationLayers(for type: WeatherType) -> [CALayer] {
        guard let bounds = bounds else { return [] }
        
        switch type {
        case .sunny: return SunAnimation().createWeatherAnimationLayers(bounds: bounds)
        case .cloudy: return CloudAnimation().createWeatherAnimationLayers(bounds: bounds)
        case .foggy: return FogAnimation().createWeatherAnimationLayers(bounds: bounds)
        case .rain: return RainAnimation().createWeatherAnimationLayers(bounds: bounds)
        case .snow: return SnowAnimation().createWeatherAnimationLayers(bounds: bounds)
        case .lightning: return LightningAnimation().createWeatherAnimationLayers(bounds: bounds)
        case .windy: return WindyAnimation().createWeatherAnimationLayers(bounds: bounds)
        case .rainbow: return RainbowAnimation().createWeatherAnimationLayers(bounds: bounds)
        }
    }

    private func setupBackgroundColor(to view: WeatherViewProtocol, weather: WeatherType) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds

        let colors = UIColor.WeatherColors(for: weather)
        gradientLayer.colors = [colors.topColor, colors.bottomColor]

        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)

        view.insertSublayer(gradientLayer, at: 0)
    }
}
