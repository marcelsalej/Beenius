//
//  UsersList.swift
//  BeeniusUITests
//
//  Created by Marcel Salej on 13/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import XCTest
import CoreGraphics

class UsersList: XCTestCase {
  var app: XCUIApplication!
  
  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
    
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    app = XCUIApplication()
    app.launch()
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testNavigationBar() {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    let app = XCUIApplication()
    XCTAssert(app
      .navigationBars["Users"]
      .exists)
  }
  
  func testTableViewTap() {
    XCUIApplication().cells
    .containing(.staticText, identifier: "Ervin Howell (Antonette)")
    .firstMatch
    .tap()
  }
  
  func testPullToRefresh() {
    let firstCell = app.staticTexts["Chelsey Dietrich (Kamren)"]
    let start = firstCell.coordinate(withNormalizedOffset: (CGVector(dx: 0, dy: 0)))
    let finish = firstCell.coordinate(withNormalizedOffset: (CGVector(dx: 0, dy: 6)))
    start.press(forDuration: 0, thenDragTo: finish)
  }
}
