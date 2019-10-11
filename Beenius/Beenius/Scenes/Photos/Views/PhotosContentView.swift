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
    if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
      layout.minimumLineSpacing = 10
      layout.minimumInteritemSpacing = 10
      layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
      let size = CGSize(width:(collectionView.bounds.width-30)/2, height: 250)
      layout.itemSize = size
    }
    collectionView.snp.makeConstraints {
      $0.top.bottom.leading.trailing.equalToSuperview()
    }
  }
}
