//
//  PhotoClientTests.swift
//  BeeniusTests
//
//  Created by Marcel Salej on 13/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import XCTest
@testable import Beenius

class PhotoClientTests: XCTestCase {

    private let networkClient = NetworkClient()
      
      func testEndpointGetConnection() {
        networkClient.GET(decode: [Album].self, endpoint: Endpoint.Albums.albumsList) { result in
          switch result {
          case .success:
            XCTAssertTrue(true)
          case .failure:
            XCTFail()
          }
        }
      }
    }
