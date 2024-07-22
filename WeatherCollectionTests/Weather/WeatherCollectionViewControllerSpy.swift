//
//  WeatherCollectionViewControllerSpy.swift
//  WeatherCollectionTests
//
//  Created by Artem Krasnov on 22.07.2024.
//

@testable import WeatherCollection
import UIKit

final class WeatherCollectionViewControllerSpy: UIViewController, WeatherCollectionViewProtocol {

    var presenter: WeatherCollection.WeatherCollectionPresenterProtocol?
    var funcUpdateWeatherViewEventCalled: Bool = false

    func didSelectWeatherEvent() {}

    func updateWeatherView(for weatherEvent: WeatherCollection.WeatherEvent) {
        funcUpdateWeatherViewEventCalled = true
    }
}

