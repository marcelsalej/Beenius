//
//  PhotoCollectionViewCell.swift
//  Beenius
//
//  Created by Marcel Salej on 11/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
  // MARK: - Lifecycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Set data
extension PhotoCollectionViewCell {
  func setData(model: ViewModel) {
  }
}

// MARK: - UI setup
private extension PhotoCollectionViewCell {
  func setupViews() {
  }
}

extension PhotoCollectionViewCell {
  struct ViewModel {
    let photoUrl: String
    let photoDescription: String
  }
}
