//
//  WeatherCollectionUITests.swift
//  WeatherCollectionUITests
//
//  Created by Artem Krasnov on 22.07.2024.
//

import XCTest

final class WeatherCollectionUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }

    func testEventCells() throws {

        /// проверяем количество ячеек на экране
        let cells = fetchCells()
        XCTAssertEqual(cells.count, 3)

        /// проверяем выравнивание по центру выбранной ячейки
        let firstCell = cells.element(boundBy: 0)
        let firstCellName = firstCell.label

        firstCell.tap()

        let newCells = fetchCells()
        let selectedCellsName = newCells.element(boundBy: 1).label
        XCTAssertEqual(firstCellName, selectedCellsName)
    }

    private func fetchCells() -> XCUIElementQuery {
        let collectionView = app.collectionViews.element(boundBy: 0)
        return collectionView.cells
    }

    private func localizedString(key: String) -> String {
        return NSLocalizedString(key, bundle: Bundle(for: WeatherCollectionUITests.self), comment: "")
    }
}
