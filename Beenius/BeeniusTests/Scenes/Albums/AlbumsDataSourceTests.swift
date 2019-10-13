//
//  AlbumsDataSourceTests.swift
//  BeeniusTests
//
//  Created by Marcel Salej on 13/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import XCTest
@testable import Beenius

class AlbumsDataSourceTests: XCTestCase {
  private let dataSource = AlbumsDataSource()
  
  func testEmptyDataSource() {
    XCTAssertEqual(dataSource.numberOfSections(), 0)
    XCTAssertEqual(dataSource.numberOfRows(in: 0), 0)
  }
  
  func testSetAlbums() {
    buildDataSource()
    XCTAssertEqual(dataSource.sections.count, 1)
    XCTAssertEqual(dataSource.sections.first?.rows.count, 3)
  }
}

extension AlbumsDataSourceTests {
  func buildDataSource() {
    dataSource.setData(viewModels: [.init(album: .init(id: 1,
                                                       userId: 1,
                                                       title: "title"),
                                          photos: [.init(id: 1,
                                                         albumId: 1,
                                                         title: "title ",
                                                         url: "url",
                                                         thumbnailUrl: "thumb url")]),
                                    .init(album: .init(id: 2,
                                                       userId: 2,
                                                       title: "title 2"),
                                          photos: [.init(id: 2,
                                                         albumId: 2,
                                                         title: "title 2",
                                                         url: "url 2",
                                                         thumbnailUrl: "thumb url 2")]),
                                    .init(album: .init(id: 3,
                                                       userId: 3,
                                                       title: "title 3"),
                                          photos: [.init(id: 3,
                                                         albumId: 3,
                                                         title: "title 3",
                                                         url: "url 3",
                                                         thumbnailUrl: "thumb url 3")])
    ])
  }
}
