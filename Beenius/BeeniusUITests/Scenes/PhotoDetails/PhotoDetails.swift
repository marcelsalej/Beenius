//
//  PhotoDetails.swift
//  BeeniusUITests
//
//  Created by Marcel Salej on 13/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import XCTest

class PhotoDetails: XCTestCase {
  func testPhotoDetailImageTap() {
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
    app.cells
     .firstMatch
     .tap()
    app
      .images
      .firstMatch
      .tap()
    XCTAssertFalse(app
        .textViews
        .containing(.staticText, identifier: "Chelsey Dietrich")
        .firstMatch
        .exists)
  }
}
