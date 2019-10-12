//
//  PhotoDetailsContentView.swift
//  Beenius
//
//  Created by Marcel Salej on 12/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class PhotoDetailsContentView: UIView {
  let fullScreenImageView = UIImageView.setupAutoLayout()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Private Methods
private extension PhotoDetailsContentView {
  func setupViews() {
    setupFullScreenImageView()
  }
  
  func setupFullScreenImageView() {
    addSubview(fullScreenImageView)
    fullScreenImageView.contentMode = .scaleToFill
    fullScreenImageView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}
