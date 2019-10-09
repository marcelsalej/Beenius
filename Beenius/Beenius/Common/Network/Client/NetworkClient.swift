//
//  NetworkClient.swift
//  Beenius
//
//  Created by Marcel Salej on 09/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Alamofire

class NetworkClient {
  private let manager: Alamofire.Session
  
  init() {
    manager = Alamofire.Session(configuration: URLSessionConfiguration.default)
  }
}

// MARK: - Public methods
extension NetworkClient: NetworkClientProtocol {
  /// GET rest api request
  func GET(endpoint: EndpointProtocol,
           parameters: NetworkClientProtocol.Params? = nil,
           headers: NetworkClientProtocol.Headers? = nil,
           _ result: DataResult) {
    request(endpoint: endpoint,
            method: .get,
            parameters: parameters,
            headers: headers,
            result
    )
  }
}
