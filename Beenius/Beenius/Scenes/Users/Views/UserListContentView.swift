//
//  UserListContentView.swift
//  Beenius
//
//  Created by Marcel Salej on 09/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class UserListContentView: UIView {
  let tableView = UITableView.setupAutoLayout()
  private let activityIndicator = UIActivityIndicatorView.setupAutoLayout()
  
  // MARK: - Init methods
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - View setup
private extension UserListContentView {
  func setupViews() {
    setupTableView()
    setupActivityIndicator()
  }
  
  func setupTableView() {
    addSubview(tableView)
    tableView.register(UserTableViewCell.self)
    tableView.snp.makeConstraints {
      $0.edges.equalTo(safeAreaLayoutGuide)
    }
  }
  
  func setupActivityIndicator() {
    addSubview(activityIndicator)
    activityIndicator.color = .gray
    activityIndicator.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
  }
}

// MARK: - Loader
extension UserListContentView {
  func toggleLoading(_ isLoading: Bool) {
    UIView.animate(withDuration: 0.2) {
      self.tableView.alpha = isLoading ? 0 : 1
      self.activityIndicator.alpha = isLoading ? 1 : 0
    }
    isLoading ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
  }
}
