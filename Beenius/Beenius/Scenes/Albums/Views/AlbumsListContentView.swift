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
  private let activityIndicatorView = UIActivityIndicatorView.setupAutoLayout()
  let tableView = UITableView.setupAutoLayout()
  let noDataView = NoDataView.setupAutoLayout()
  
  // MARK: - Init methods
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
   func setupNoDataView() {
    noDataView.backgroundColor = .red
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
private extension AlbumsListContentView {
  func setupViews() {
    setupActivityIndicatorView()
    setupTableView()
    setupRefreshControl()
  }
  
  func setupActivityIndicatorView() {
    addSubview(activityIndicatorView)
    activityIndicatorView.color = .gray
    activityIndicatorView.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
  }
  
  func setupTableView() {
    addSubview(tableView)
    tableView.register(AlbumTableViewCell.self)
    tableView.snp.makeConstraints {
      $0.edges.equalTo(safeAreaLayoutGuide)
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
      self.activityIndicatorView.alpha = isLoading ? 1 : 0
    }
    isLoading ? activityIndicatorView.startAnimating() : activityIndicatorView.stopAnimating()
  }
}
