//
//  UserListDataSourceTests.swift
//  BeeniusTests
//
//  Created by Marcel Salej on 13/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import XCTest
@testable import Beenius

class UserListDataSourceTests: XCTestCase {
  private let dataSource = UsersListDataSource()
  
  func testEmptyDataSource() {
    XCTAssertEqual(dataSource.numberOfSections(), 0)
    XCTAssertEqual(dataSource.numberOfRows(in: 0), 0)
  }
  
  func testSetUsers() {
    buildDataSource()
    XCTAssertEqual(dataSource.sections.count, 1)
    XCTAssertEqual(dataSource.sections.first?.rows.count, 3)
  }
}

extension UserListDataSourceTests {
  func buildDataSource() {
    dataSource.setData(users: [.init(id: 1,
                                     name: "name",
                                     username: "username",
                                     email: "email",
                                     phone: "phone",
                                     website: "website",
                                     address: .init(street: "street",
                                                    suite: "suite",
                                                    city: "city",
                                                    zipcode: "zipcode",
                                                    geo: .init(lat: "lat",
                                                               lng: "lng")),
                                     company: .init(name: "company name",
                                                    catchPhrase: "test catch phrase",
                                                    bs: "test bs")),
                               .init(id: 2,
                                     name: "name 1",
                                     username: "username 1",
                                     email: "email 1",
                                     phone: "phone 1",
                                     website: "website 1",
                                     address: .init(street: "street 1",
                                                    suite: "suite 1",
                                                    city: "city 1",
                                                    zipcode: "zipcode 1",
                                                    geo: .init(lat: "lat 1",
                                                               lng: "lng 1")),
                                     company: .init(name: "company name 1",
                                                    catchPhrase: "test catch phrase 1",
                                                    bs: "test bs 1")),
                               .init(id: 3,
                                     name: "name 2",
                                     username: "username 2",
                                     email: "email 2",
                                     phone: "phone 2",
                                     website: "website 2",
                                     address: .init(street: "street 2 ",
                                                    suite: "suite 2",
                                                    city: "city 2",
                                                    zipcode: "zipcode 2",
                                                    geo: .init(lat: "lat 2",
                                                               lng: "lng 2")),
                                     company: .init(name: "company name 2",
                                                    catchPhrase: "test catch phrase",
                                                    bs: "test bs"))])
  }
}
