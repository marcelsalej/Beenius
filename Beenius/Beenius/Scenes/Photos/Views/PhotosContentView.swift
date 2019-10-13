//
//  PhotosContentView.swift
//  Beenius
//
//  Created by Marcel Salej on 11/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class PhotosContentView: UIView {
  let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).setupAutoLayout()
  private let activityIndicatorView = UIActivityIndicatorView.setupAutoLayout()
  private let cellSpacing: CGFloat = 30
  let refreshControl = UIRefreshControl.setupAutoLayout()
  private let noDataView = NoDataView.setupAutoLayout()
  
  // MARK: - Init methods
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupNoDataView() {
    noDataView.isHidden = true
    addSubview(noDataView)
    noDataView.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
    UIView.animate(withDuration: 0.3) {
      self.noDataView.isHidden = false
    }
  }
  
  func hideNoDataView() {
    UIView.animate(withDuration: 0.2) {
      self.noDataView.isHidden = true
    }
  }
}

// MARK: - UI setup
private extension PhotosContentView {
  func setupViews() {
    setupActivityIndicatorView()
    setupCollectionView()
    setupRefreshControl()
  }
  
  func setupCollectionView() {
    addSubview(collectionView)
    collectionView.register(PhotoCollectionViewCell.self)
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - cellSpacing, height: (UIScreen.main.bounds.width / 2) - cellSpacing )
       layout.minimumInteritemSpacing = cellSpacing / 2
       layout.minimumLineSpacing = cellSpacing / 2
       layout.sectionInset = UIEdgeInsets(top: cellSpacing / 2, left: cellSpacing / 2, bottom: cellSpacing / 2, right: cellSpacing / 2)
    collectionView.collectionViewLayout = layout
    collectionView.backgroundColor = .white
    collectionView.snp.makeConstraints {
      $0.top.bottom.leading.trailing.equalToSuperview()
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
     collectionView.refreshControl = refreshControl
   }
}

// MARK: - Loader
extension PhotosContentView {
  func toggleLoading(_ isLoading: Bool) {
    UIView.animate(withDuration: 0.2) {
      self.collectionView.alpha = isLoading ? 0 : 1
      self.activityIndicatorView.alpha = isLoading ? 1 : 0
    }
    isLoading ? activityIndicatorView.startAnimating() : activityIndicatorView.stopAnimating()
  }
}
