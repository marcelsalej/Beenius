//
//  AlbumsSection.swift
//  Beenius
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

enum AlbumsSection: SectionProtocol {
  case albums(rows: [AlbumsRow])
  
  var rows: [AlbumsRow] {
    switch self {
    case .albums(let rows):
      return rows
    }
  }
}
