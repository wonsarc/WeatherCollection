//
//  WeatherEventService.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 16.07.2024.
//

import Foundation

protocol WeatherEventServiceProtocol {
    func fetchWeatherEvents() -> [WeatherEvent]
}

final class WeatherEventService: WeatherEventServiceProtocol {

    // MARK: - Private Properties

    private lazy var events: [WeatherEvent] = {
        WeatherEventService.createEvents()
    }()

    // MARK: - Public Methods

    func fetchWeatherEvents() -> [WeatherEvent] {
        events
    }

    // MARK: - Private Methods

    private static func createEvents() -> [WeatherEvent] {
        let types: [WeatherType] = [.sunny, .cloudy, .foggy, .rain, .snow, .lightning, .windy, .rainbow]
        return types.map { WeatherEvent(type: $0) }
    }
}
