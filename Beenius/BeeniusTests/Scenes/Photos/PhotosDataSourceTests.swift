//
//  PhotosDataSourceTests.swift
//  BeeniusTests
//
//  Created by Marcel Salej on 13/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import XCTest

@testable import Beenius

class PhotosDataSourceTests: XCTestCase {
  private let dataSource = PhotoListDataSource()
  
  func testEmptyDataSource() {
    XCTAssertEqual(dataSource.numberOfSections(), 0)
    XCTAssertEqual(dataSource.numberOfRows(in: 0), 0)
  }
  
  func testSetPhotos() {
    buildDataSource()
    XCTAssertEqual(dataSource.sections.count, 1)
    XCTAssertEqual(dataSource.sections.first?.rows.count, 3)
  }
}

extension PhotosDataSourceTests {
  func buildDataSource() {
    dataSource.setData(photos: [.init(id: 1,
                                      albumId: 1,
                                      title: "title ",
                                      url: "url",
                                      thumbnailUrl: "thumb url"),
                                .init(id: 2,
                                      albumId: 2,
                                      title: "title 2",
                                      url: "url 2",
                                      thumbnailUrl: "thumb url 2"),
                                .init(id: 3,
                                      albumId: 3,
                                      title: "title 2",
                                      url: "url 2",
                                      thumbnailUrl: "thumb url 2")])
  }
}
