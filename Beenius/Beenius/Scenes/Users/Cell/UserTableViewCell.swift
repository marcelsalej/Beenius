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
  
  // MARK: - Init methods
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
     super.init(style: style, reuseIdentifier: reuseIdentifier)
     setupViews()
   }
   
   required init?(coder aDecoder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
   }
}

// MARK: - Set data
extension UserTableViewCell {
  func setData(from viewModel: ViewModel) {
    usernameNameLabel.text = String(format: "%@ (%@)", viewModel.name, viewModel.username)
    companyLabel.text = viewModel.company
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
    usernameNameLabel.font = UIFont.custom(style: .book, size: 14)
    usernameNameLabel.snp.makeConstraints {
      $0.top.equalToSuperview().inset(20)
      $0.leading.equalToSuperview().inset(30)
    }
  }
  
  func setupCompanyLabel() {
    addSubview(companyLabel)
    companyLabel.font = UIFont.custom(style: .boldItalic, size: 10)
    companyLabel.snp.makeConstraints {
      $0.top.equalTo(usernameNameLabel.snp.bottom).offset(5)
      $0.leading.equalToSuperview().inset(30)
      $0.bottom.equalToSuperview().inset(20)
    }
  }
}

// MARK: - ViewModel
extension UserTableViewCell {
  struct ViewModel {
    let username: String
    let name: String
    let company: String
  }
}
