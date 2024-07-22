//
//  WeatherViewTests.swift
//  WeatherCollectionTests
//
//  Created by Artem Krasnov on 22.07.2024.
//

@testable import WeatherCollection
import XCTest

final class WeatherViewTests: XCTestCase {

    func testPresenterCallsDidSelectWeatherEvent() {

        /// given
        let viewController = WeatherCollectionViewControllerSpy()
        let presenter = WeatherCollectionPresenter()
        viewController.presenter = presenter
        presenter.view = viewController

        /// when
        presenter.didSelectWeatherEvent(IndexPath(row: 0, section: 0))

        /// then
        XCTAssertTrue(viewController.funcUpdateWeatherViewEventCalled)
    }
}
