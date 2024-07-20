//
//  WeatherCollectionPresenter.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 16.07.2024.
//

import Foundation

protocol WeatherCollectionPresenterProtocol {

    var view: WeatherCollectionViewProtocol? { get set }
    var currentAnimation: WeatherAnimationProtocol? { get }
    var events: [WeatherEvent] { get }

    func didSelectWeatherEvent(_ indexPath: IndexPath)
}

final class WeatherCollectionPresenter: WeatherCollectionPresenterProtocol {

    // MARK: - Public Properties

    weak var view: WeatherCollectionViewProtocol?

    lazy var events: [WeatherEvent] = weatherEventService.fetchWeatherEvents()

    var currentAnimation:  WeatherAnimationProtocol?

    // MARK: - Private Properties

    private let weatherEventService: WeatherEventServiceProtocol

    // MARK: - Initializer

    init(with weatherView: WeatherView) {
        self.weatherEventService = WeatherEventService()
    }

    // MARK: - Public Methods

    func didSelectWeatherEvent(_ indexPath: IndexPath) {
        currentAnimation = updateCurrentAnimation(set: events[indexPath.row])
        view?.updateWeatherView(for: events[indexPath.row])
    }

    // MARK: - Private Methods

    private func updateCurrentAnimation(set event: WeatherEvent) -> WeatherAnimationProtocol {
        switch event.type {
        case .sunny: return SunAnimation()
        case .cloudy: return CloudAnimation()
        case .foggy: return FogAnimation()
        case .rain: return RainAnimation()
        case .lightning: return LightningAnimation()
        case .windy: return WindyAnimation()
        case .snow: return SnowAnimation()
        case .rainbow: return RainbowAnimation()
        }
    }
}
