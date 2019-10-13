//
//  UsersListDataSourceDataSource.swift
//  Beenius
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class UsersListDataSource: NSObject, DataSourceProtocol {
  var sections: [UsersListDataSourceSection] = []
  
  override init() {
    super.init()
  }
}

// MARK: - Public Methods
extension UsersListDataSource {
  func setData(users: [User]) {
    sections.removeAll()
    var rows = [UsersListDataSourceRow]()
    users.forEach { user in
      rows.append(.user(.init(username: user.username,
                              name: user.name,
                              company: user.company.name)))
    }
    sections.append(.userList(rows: rows))
  }
}

// MARK: - UITableViewDataSource
extension UsersListDataSource: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return numberOfSections()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numberOfRows(in: section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let row = section(at: indexPath.section)?.row(at: indexPath.row) else {
      Logger.error("No available row in usersList dataSource at given indexPath \(indexPath)!")
      return UITableViewCell()
    }
    
    switch row {
    case .user(let model):
      let cell = tableView.dequeueReusableCell(UserTableViewCell.self, at: indexPath)
      cell.setData(from: model)
      return cell
    }
  }
}
