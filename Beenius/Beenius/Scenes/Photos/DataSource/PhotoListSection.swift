//
//  PhotoListSection.swift
//  Beenius
//
//  Created by Marcel Salej on 11/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

enum PhotoListSection: SectionProtocol {
  case photoList(rows: [PhotoListRow])
  
  var rows: [PhotoListRow] {
    switch self {
    case .photoList(let rows):
      return rows
    }
  }
}
