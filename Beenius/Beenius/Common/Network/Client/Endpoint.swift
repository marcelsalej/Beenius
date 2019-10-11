//
//  Endpoint.swift
//  Beenius
//
//  Created by Marcel Salej on 09/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

enum Endpoint {}

extension Endpoint {
  enum User: EndpointProtocol {
    case userList
    
    // Add other endpoint regarded to user if needed
    var path: String {
      switch self {
      case .userList:
        return "/users"
      }
    }
  }
  
  enum Albums: EndpointProtocol {
    case albumsList
    
    // Add other endpoints regarded to albums if needed
    var path: String {
      switch self {
      case .albumsList:
        return "/albums"
      }
    }
  }
  
  enum Photo: EndpointProtocol {
    case photoList
    
    // Add other endpoints regarderd to photos if needed
    var path: String {
      switch self {
      case .photoList:
        return "/photos"
      }
    }
  }
}
