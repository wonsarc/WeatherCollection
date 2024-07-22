//
//  WeatherCollectionPresenter.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 16.07.2024.
//

import Foundation

protocol WeatherCollectionPresenterProtocol {
    var view: WeatherCollectionViewProtocol? { get }
    var events: [WeatherEvent] { get }
    func didSelectWeatherEvent(_ indexPath: IndexPath)
    func changeAnimate(on view: WeatherViewProtocol)
}

final class WeatherCollectionPresenter: WeatherCollectionPresenterProtocol {

    // MARK: - Public Properties

    weak var view: WeatherCollectionViewProtocol?
    lazy var events: [WeatherEvent] = weatherEventService.fetchWeatherEvents()

    // MARK: - Private Properties

    private let weatherEventService: WeatherEventServiceProtocol
    private let animateWeatherService: AnimateWeatherServiceProtocol
    private var currentType: WeatherType?

    // MARK: - Initializer

    init() {
        self.weatherEventService = WeatherEventService()
        self.animateWeatherService = AnimateWeatherService()
    }

    // MARK: - Public Methods

    func didSelectWeatherEvent(_ indexPath: IndexPath) {
        currentType = events[indexPath.row].type
        view?.updateWeatherView(for: events[indexPath.row])
    }

    func changeAnimate(on view: WeatherViewProtocol) {
        guard let currentType = currentType else { return }
        animateWeatherService.changeAnimation(to: view, type: currentType)
    }
}
