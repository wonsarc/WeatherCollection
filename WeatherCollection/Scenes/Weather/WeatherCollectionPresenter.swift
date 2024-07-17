//
//  WeatherCollectionPresenter.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 16.07.2024.
//

import Foundation

protocol WeatherCollectionPresenterProtocol {

    var view: WeatherCollectionViewProtocol? { get set }
    var events: [WeatherEvent] { get }

    func didSelectWeatherEvent(_ indexPath: IndexPath)
}

final class WeatherCollectionPresenter: WeatherCollectionPresenterProtocol {

    // MARK: - Public Properties

    weak var view: WeatherCollectionViewProtocol?

    lazy var events: [WeatherEvent] = {
        return weatherEventService.fetchWeatherEvents()
    }()

    // MARK: - Private Properties

    private let weatherEventService = WeatherEventService()
    
    // MARK: - Public Methods

    func didSelectWeatherEvent(_ indexPath: IndexPath) {

        view?.selectWeatherEvent(at: events[indexPath.row])
    }
}
