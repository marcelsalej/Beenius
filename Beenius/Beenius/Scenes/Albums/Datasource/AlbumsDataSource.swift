//
//  AlbumsDataSource.swift
//  Beenius
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class AlbumsDataSource: NSObject, DataSourceProtocol {
  var sections: [AlbumsSection] = []
  
  override init() {
    super.init()
  }
}

// MARK: - Public Methods
extension AlbumsDataSource {
  //func setData(...) {
  //  // generate section
  //  //sections = [section]
  //}
}

// MARK: - UITableView DataSource
extension AlbumsDataSource: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return numberOfSections()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numberOfRows(in: section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let row = section(at: indexPath.section)?.row(at: indexPath.row) else {
      Logger.error("No available row in dataSource at given indexPath \(indexPath)!")
      return UITableViewCell()
    }
    
    switch row {
    case .album(let model):
      return UITableViewCell()
    }
  }
}
