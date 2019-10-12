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
  private let cellSpacing: CGFloat = 30
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - UI setup
private extension PhotosContentView {
  func setupViews() {
    setupCollectionView()
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
}
