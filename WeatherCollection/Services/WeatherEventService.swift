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
        fillEvents(&events)
        return events
    }()

    // MARK: - Public Methods

    func fetchWeatherEvents() -> [WeatherEvent] {
        events
    }

    // MARK: - Private Methods

    private func fillEvents(_ events: inout [WeatherEvent]) {

        events.append(
            WeatherEvent(
                type: .sunny,
                title: NSLocalizedString("events.weather.sun", comment: "")
            )
        )

        events.append(
            WeatherEvent(
                type: .cloudy,
                title: NSLocalizedString("events.weather.cloud", comment: "")
            )
        )

        events.append(
            WeatherEvent(
                type: .foggy,
                title: NSLocalizedString("events.weather.fog", comment: "")
            )
        )

        events.append(
            WeatherEvent(
                type: .rain,
                title: NSLocalizedString("events.weather.rain", comment: "")
            )
        )

        events.append(
            WeatherEvent(
                type: .snow,
                title: NSLocalizedString("events.weather.snow", comment: "")
            )
        )

        events.append(
            WeatherEvent(
                type: .sunny,
                title: NSLocalizedString("events.weather.sun", comment: "")
            )
        )

        events.append(
            WeatherEvent(
                type: .cloudy,
                title: NSLocalizedString("events.weather.cloud", comment: "")
            )
        )

        events.append(
            WeatherEvent(
                type: .foggy,
                title: NSLocalizedString("events.weather.fog", comment: "")
            )
        )

        events.append(
            WeatherEvent(
                type: .rain,
                title: NSLocalizedString("events.weather.rain", comment: "")
            )
        )
    }
}
