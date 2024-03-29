//
//  DemoUITests.swift
//  DemoUITests
//
//  Created by Artem Lashmanov on 12/2/21.
//

import XCTest
import Demo

class DemoUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPathAudioBundle() throws { // проверяем наличие всех войсов
        
        let testBundle = Bundle(for: type(of: self))
        
        for index in 1...7 {
            let filePath = testBundle.path(forResource: "voice_example_\(index)", ofType: "mp3")
        
            XCTAssertNotNil(filePath)
            
        }
        
    }
    
    func testPathLocalizableBundle () throws { // проверяем существует ли Localizable.strings
        
        
        // Localizable.strings
        // Resources/en.lproj
        
        let testBundle = Bundle(for: type(of: self))
        let filePath = testBundle.path(forResource: "Localizable", ofType: "strings", inDirectory: "en.lproj")
        
        
        XCTAssertNotNil(filePath)
        
    }
    
    func testTitle() throws { // проверяем наличие лейбла "test"
        
        let app = XCUIApplication()
        app.launch()
        
        let titleLabel = app.staticTexts["test"]
        
        XCTAssert(titleLabel.exists)
        
    }
    
    func testSwipes () throws { // тест свайпов
        
        let app = XCUIApplication()
        app.launch()
        
        let countCells: Int = 7
        let collectionView = app.collectionViews.element
        
        XCTAssert(collectionView.exists) // проверяем существует ли коллекция
        
        for index in 1..<countCells {
            
            let cellElement = collectionView.cells.element(boundBy: 0)
            XCTAssert(cellElement.exists)  // проверяем существует ли ячейка
            
            let voiceLabel = cellElement.staticTexts["Voice example \(index)"]
            XCTAssert(voiceLabel.exists) // проверяем наличие лейбла
            
            cellElement.swipeLeft()
            
        }
        
        for index in 1..<countCells {
            
            let cellElement = collectionView.cells.element(boundBy: 0)
            XCTAssert(cellElement.exists)  // проверяем существует ли ячейка
            
            cellElement.swipeRight()

          
            let voiceLabel = cellElement.staticTexts["Voice example \(countCells - index)"]
            XCTAssert(voiceLabel.exists) // проверяем наличие лейбла
            
        }
        
    }
    
    
    func testTaps () throws { // тест тапа первой ячейки
        let app = XCUIApplication()
        app.launch()
        
        let collectionView = app.collectionViews.element
        
        XCTAssert(collectionView.exists) // проверяем существует ли коллекция
        
        let cellElement = collectionView.cells.element(boundBy: 0)
        
        XCTAssert(cellElement.exists)  // проверяем существует ли ячейка
        
        cellElement.tap()
        XCTAssert(cellElement.isSelected) // ячейка тапнута?
        
    }
    
    func testSomething() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
