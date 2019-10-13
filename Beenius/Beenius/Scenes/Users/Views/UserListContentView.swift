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
  let noDataView = NoDataView.setupAutoLayout()
  lazy var refreshControl = UIRefreshControl.setupAutoLayout()
  private let activityIndicatorView = UIActivityIndicatorView.setupAutoLayout()
  
  // MARK: - Init methods
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupNoDataView() {
    tableView.backgroundView = noDataView
    tableView.separatorColor = .clear
    noDataView.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
    UIView.animate(withDuration: 0.3) {
      self.noDataView.isHidden = false
    }
  }
  
  func hideNoDataView() {
    tableView.backgroundView = nil
    tableView.separatorColor = .lightGray
    UIView.animate(withDuration: 0.2) {
      self.noDataView.isHidden = true
    }
  }
}

// MARK: - UI setup
private extension UserListContentView {
  func setupViews() {
    setupTableView()
    setupActivityIndicatorView()
    setupRefreshControl()
  }
  
  func setupTableView() {
    addSubview(tableView)
    tableView.register(UserTableViewCell.self)
    tableView.snp.makeConstraints {
      $0.edges.equalTo(safeAreaLayoutGuide)
    }
  }
  
  func setupActivityIndicatorView() {
    addSubview(activityIndicatorView)
    activityIndicatorView.color = .gray
    activityIndicatorView.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
  }
  
  func setupRefreshControl() {
    refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
    refreshControl.tintColor = .darkGray
    tableView.addSubview(refreshControl)
  }
}

// MARK: - Loader
extension UserListContentView {
  func toggleLoading(_ isLoading: Bool) {
    UIView.animate(withDuration: 0.2) {
      self.tableView.alpha = isLoading ? 0 : 1
      self.activityIndicatorView.alpha = isLoading ? 1 : 0
    }
    isLoading ? activityIndicatorView.startAnimating() : activityIndicatorView.stopAnimating()
  }
}
