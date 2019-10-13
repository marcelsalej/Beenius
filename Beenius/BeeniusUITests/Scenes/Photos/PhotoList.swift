//
//  PhotoList.swift
//  BeeniusUITests
//
//  Created by Marcel Salej on 13/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import XCTest

class PhotoList: XCTestCase {
  func testNavigationBar() {
    let app = XCUIApplication()
    app.launch()
    app.cells
      .containing(.staticText, identifier: "Chelsey Dietrich (Kamren)")
      .firstMatch
      .tap()
    
    app.cells
      .containing(.staticText, identifier: "aperiam doloremque nihil")
      .firstMatch
      .tap()
    
    XCTAssert(app
      .navigationBars["aperiam doloremque nihil"]
      .exists)
  }
  
  func testTableViewTap() {
    let app = XCUIApplication()
    app.launch()
    app.cells
      .containing(.staticText, identifier: "Chelsey Dietrich (Kamren)")
      .firstMatch
      .tap()
    
    app
      .cells
      .containing(.staticText, identifier: "aperiam doloremque nihil")
      .firstMatch
      .tap()
    
    app.cells
      .containing(.staticText, identifier: "est iure nihil reiciendis")
      .firstMatch
      .tap()
  }
  
  func testPullToRefresh() {
    let app = XCUIApplication()
    app.launch()
    app
      .cells
      .containing(.staticText, identifier: "Chelsey Dietrich (Kamren)")
      .firstMatch
      .tap()
    
    app.cells
      .containing(.staticText, identifier: "aperiam doloremque nihil")
      .firstMatch
      .tap()
    let firstCell = app.cells
      .containing(.staticText, identifier: "adipisci assumenda cumque molestiae reiciendis nostrum")
      .firstMatch
    let start = firstCell.coordinate(withNormalizedOffset: (CGVector(dx: 0, dy: 0)))
    let finish = firstCell.coordinate(withNormalizedOffset: (CGVector(dx: 0, dy: 10)))
    start.press(forDuration: 0, thenDragTo: finish)
  }
}
