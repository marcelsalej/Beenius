//
//  UserClientTests.swift
//  BeeniusTests
//
//  Created by Marcel Salej on 13/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import XCTest
@testable import Beenius

class UserClientTests: XCTestCase {
  private let networkClient = NetworkClient()
  
  func testEndpointGetConnection() {
    networkClient.GET(decode: [User].self, endpoint: Endpoint.User.userList) { result in
      switch result {
      case .success:
        XCTAssertTrue(true)
      case .failure:
        XCTFail()
      }
    }
  }
}
