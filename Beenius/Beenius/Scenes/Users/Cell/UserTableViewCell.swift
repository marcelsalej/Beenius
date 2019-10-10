//
//  UserTableViewCell.swift
//  Beenius
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
  private let usernameNameLabel = UILabel.setupAutoLayout()
  private let companyLabel = UILabel.setupAutoLayout()
  
  // MARK: - Lifecycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
     super.init(style: style, reuseIdentifier: reuseIdentifier)
     setupViews()
   }
   
   required init?(coder aDecoder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
   }
}

// MARK: - UI Setup
private extension UserTableViewCell {
  func setupViews() {
    setupUsernameNameLabel()
    setupCompanyLabel()
  }
  
  func setupUsernameNameLabel() {
    addSubview(usernameNameLabel)
  }
  
  func setupCompanyLabel() {
    
  }
}

// MARK: - ViewModel
extension UserTableViewCell {
  struct ViewModel {
  }
}
