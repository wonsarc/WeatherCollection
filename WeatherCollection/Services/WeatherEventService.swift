//
//  WeatherEventService.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 16.07.2024.
//

import UIKit

protocol WeatherEventServiceProtocol {
    func fetchWeatherEvents() -> [WeatherEvent]
}

final class WeatherEventService: WeatherEventServiceProtocol {

    // MARK: - Private Properties

    private lazy var events: [WeatherEvent] = {
        var events: [WeatherEvent] = []
        WeatherEventService.fillEvents(&events)
        return events
    }()

    // MARK: - Public Methods

    func fetchWeatherEvents() -> [WeatherEvent] {
        events
    }

    // MARK: - Private Methods

    private static func fillEvents(_ events: inout [WeatherEvent]) {
        let types: [WeatherType] = [.sunny, .cloudy, .foggy, .rain, .snow, .lightning, .windy, .rainbow]

        for type in types {
            events.append(WeatherEvent(type: type))
        }
    }
}
