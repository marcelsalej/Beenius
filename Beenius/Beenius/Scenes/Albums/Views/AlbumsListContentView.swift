//
//  AlbumsListContentView.swift
//  Beenius
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class AlbumsListContentView: UIView {
  lazy var refreshControl = UIRefreshControl.setupAutoLayout()
  private let activityIndicator = UIActivityIndicatorView.setupAutoLayout()
  let tableView = UITableView.setupAutoLayout()
  let noDataView = UIView.setupAutoLayout()
  
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

// MARK: - Private Methods
private extension AlbumsListContentView {
  func setupViews() {
    setupActivityIndicator()
    setupTableView()
    setupRefreshControl()
  }
  
  func setupActivityIndicator() {
    addSubview(activityIndicator)
    activityIndicator.color = .gray
    activityIndicator.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
  }
  
  func setupTableView() {
    addSubview(tableView)
    tableView.register(AlbumTableViewCell.self)
    tableView.snp.makeConstraints {
      $0.top.bottom.leading.trailing.equalToSuperview()
    }
  }
  
  func setupRefreshControl() {
    refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
    refreshControl.tintColor = .darkGray
    tableView.addSubview(refreshControl)
  }
}

// MARK: - Loader
extension AlbumsListContentView {
  func toggleLoading(_ isLoading: Bool) {
    UIView.animate(withDuration: 0.2) {
      self.tableView.alpha = isLoading ? 0 : 1
      self.activityIndicator.alpha = isLoading ? 1 : 0
    }
    isLoading ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
  }
}
