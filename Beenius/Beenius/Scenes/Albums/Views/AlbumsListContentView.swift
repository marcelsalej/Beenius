//
//  AlbumsListContentView.swift
//  Beenius
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class AlbumsListContentView: UIView {
  private let refreshControl = UIRefreshControl.setupAutoLayout()
  private let activityIndicator = UIActivityIndicatorView.setupAutoLayout()
  private let tableView = UITableView.setupAutoLayout()
  private let noDataView = UIView.setupAutoLayout()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Private Methods
private extension AlbumsListContentView {
  func setupViews() {
    setupActivityIndicator()
    setupTableView()
    setupRefreshControl()
    setupNoDataView()
  }
  
  func setupNoDataView() {
    addSubview(noDataView)
    tableView.backgroundView = noDataView
    tableView.separatorColor = .clear
    noDataView.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
    UIView.animate(withDuration: 0.3) {
      self.noDataView.isHidden = false
    }
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
