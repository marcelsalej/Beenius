//
//  Endpoint.swift
//  Beenius
//
//  Created by Marcel Salej on 09/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

enum Endpoint {
  case userList
  case albumList
  case photoList
}

extension Endpoint {
  
  var path: String {
    switch self {
    case .userList:
      return "/users"
    case .albumList:
      return "/albums"
    case .photoList:
      return "/photos"
    }
  }
}
