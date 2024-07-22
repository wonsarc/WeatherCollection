//
//  LocalizationTests.swift
//  WeatherCollectionTests
//
//  Created by Artem Krasnov on 22.07.2024.
//

import XCTest

class LocalizationTests: XCTestCase {

    func testEnglishLocalization() {
        let locale = Locale(identifier: "en")

        XCTAssertEqual(localizedString(forKey: "events.weather.sun", locale: locale), "Sunny")
        XCTAssertEqual(localizedString(forKey: "events.weather.cloud", locale: locale), "Cloudy")
        XCTAssertEqual(localizedString(forKey: "events.weather.fog", locale: locale), "Foggy")
        XCTAssertEqual(localizedString(forKey: "events.weather.rain", locale: locale), "Rainly")
        XCTAssertEqual(localizedString(forKey: "events.weather.lightning", locale: locale), "Lightning")
        XCTAssertEqual(localizedString(forKey: "events.weather.windy", locale: locale), "Windy")
        XCTAssertEqual(localizedString(forKey: "events.weather.snow", locale: locale), "Snowly")
        XCTAssertEqual(localizedString(forKey: "events.weather.rainbow", locale: locale), "Rainbow")
    }

    func testRussianLocalization() {
        let locale = Locale(identifier: "ru")

        XCTAssertEqual(localizedString(forKey: "events.weather.sun", locale: locale), "Солнечно")
        XCTAssertEqual(localizedString(forKey: "events.weather.cloud", locale: locale), "Облачно")
        XCTAssertEqual(localizedString(forKey: "events.weather.fog", locale: locale), "Туман")
        XCTAssertEqual(localizedString(forKey: "events.weather.rain", locale: locale), "Дождь")
        XCTAssertEqual(localizedString(forKey: "events.weather.lightning", locale: locale), "Гроза")
        XCTAssertEqual(localizedString(forKey: "events.weather.windy", locale: locale), "Ветренно")
        XCTAssertEqual(localizedString(forKey: "events.weather.snow", locale: locale), "Снег")
        XCTAssertEqual(localizedString(forKey: "events.weather.rainbow", locale: locale), "Радуга")
    }

    private func localizedString(forKey key: String, locale: Locale) -> String {
        guard let bundlePath = Bundle.main.path(forResource: locale.identifier, ofType: "lproj"),
              let bundle = Bundle(path: bundlePath) else {
            return ""
        }
        return NSLocalizedString(key, bundle: bundle, comment: "")
    }
}
