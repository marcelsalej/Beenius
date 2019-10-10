//
//  UsersListDataSourceSection.swift
//  Beenius
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

enum UsersListDataSourceSection: SectionProtocol {
  case userList(rows: [UsersListDataSourceRow])
  
  var rows: [UsersListDataSourceRow] {
    switch self {
    case .userList(let rows):
      return rows
    }
  }
}
