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
                type: .clouds,
                title: NSLocalizedString("events.weather.cloud", comment: ""),
                backgroundColor: UIColor(resource: .clearDay)
            )
        )

        events.append(
            WeatherEvent(
                type: .fog,
                title: NSLocalizedString("events.weather.fog", comment: ""),
                backgroundColor: UIColor(resource: .foggy)
            )
        )

        events.append(
            WeatherEvent(
                type: .clouds,
                title: NSLocalizedString("events.weather.cloud", comment: ""),
                backgroundColor: UIColor(resource: .clearDay)
            )
        )

        events.append(
            WeatherEvent(
                type: .fog,
                title: NSLocalizedString("events.weather.fog", comment: ""),
                backgroundColor: UIColor(resource: .foggy)
            )
        )

        events.append(
            WeatherEvent(
                type: .clouds,
                title: NSLocalizedString("events.weather.cloud", comment: ""),
                backgroundColor: UIColor(resource: .clearDay)
            )
        )

        events.append(
            WeatherEvent(
                type: .fog,
                title: NSLocalizedString("events.weather.fog", comment: ""),
                backgroundColor: UIColor(resource: .foggy)
            )
        )

        events.append(
            WeatherEvent(
                type: .clouds,
                title: NSLocalizedString("events.weather.cloud", comment: ""),
                backgroundColor: UIColor(resource: .clearDay)
            )
        )

        events.append(
            WeatherEvent(
                type: .fog,
                title: NSLocalizedString("events.weather.fog", comment: ""),
                backgroundColor: UIColor(resource: .foggy)
            )
        )
    }
}
