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
                title: NSLocalizedString("sun", comment: ""),
                image: UIImage(systemName: "sun.max") ?? UIImage(),
                backgroundColor: .orange
            )
        )

        events.append(
            WeatherEvent(
                title: NSLocalizedString("cloud", comment: ""),
                image: UIImage(systemName: "cloud") ?? UIImage(),
                backgroundColor: .lightGray
            )
        )

        events.append(
            WeatherEvent(
                title: NSLocalizedString("rain", comment: ""),
                image: UIImage(systemName: "cloud.rain") ?? UIImage(),
                backgroundColor: .darkGray
            )
        )

        events.append(
            WeatherEvent(
                title: NSLocalizedString("snow", comment: ""),
                image: UIImage(systemName: "cloud.snow") ?? UIImage(),
                backgroundColor: .blue
            )
        )

        events.append(
            WeatherEvent(
                title: NSLocalizedString("tornado", comment: ""),
                image: UIImage(systemName: "tornado") ?? UIImage(),
                backgroundColor: .gray
            )
        )

        events.append(
            WeatherEvent(
                title: NSLocalizedString("fog", comment: ""),
                image: UIImage(systemName: "cloud.fog") ?? UIImage(),
                backgroundColor: .systemGray6
            )
        )

        events.append(
            WeatherEvent(
                title: NSLocalizedString("bolt", comment: ""),
                image: UIImage(systemName: "cloud.bolt") ?? UIImage(),
                backgroundColor: .yellow
            )
        )

        events.append(
            WeatherEvent(
                title: NSLocalizedString("rainbow", comment: ""),
                image: UIImage(systemName: "rainbow") ?? UIImage(),
                backgroundColor: .magenta
            )
        )
    }
}
