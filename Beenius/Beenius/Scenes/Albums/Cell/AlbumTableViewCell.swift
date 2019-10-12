//
//  AlbumTableViewCell.swift
//  Beenius
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit
import Kingfisher

class AlbumTableViewCell: UITableViewCell {
  private let albumTitleLabel = UILabel.setupAutoLayout()
  private let albumImage = UIImageView.setupAutoLayout()
  
  // MARK: - Init methods
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
     super.init(style: style, reuseIdentifier: reuseIdentifier)
     setupViews()
   }
   
   required init?(coder aDecoder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
   }
}

// MARK: - Set data
extension AlbumTableViewCell {
  func setData(from viewModel: ViewModel) {
    albumTitleLabel.text = viewModel.albumTitle
    albumImage.kf.setImage(with: URL(string: viewModel.albumPhotoUrl))
  }
}

// MARK: - UI Setup
private extension AlbumTableViewCell {
  func setupViews() {
    setupAlbumTitleLabel()
    setupAlbumImage()
  }
  
  func setupAlbumTitleLabel() {
    addSubview(albumTitleLabel)
    albumTitleLabel.font = UIFont.custom(style: .book, size: 14)
    albumTitleLabel.numberOfLines = 0
    albumTitleLabel.lineBreakMode = .byWordWrapping
    albumTitleLabel.snp.makeConstraints {
      $0.leading.equalToSuperview().inset(30)
      $0.centerY.equalToSuperview()
    }
  }
  
  func setupAlbumImage() {
    addSubview(albumImage)
    albumImage.contentMode = .scaleAspectFit
    albumImage.snp.makeConstraints {
      $0.trailing.equalToSuperview().inset(10)
      $0.top.bottom.equalToSuperview().inset(10)
      $0.leading.equalTo(albumTitleLabel.snp.trailing).offset(10)
      $0.width.height.equalTo(150)
    }
  }
}

// MARK: - ViewModel
extension AlbumTableViewCell {
  struct ViewModel {
    let albumTitle: String
    let albumPhotoUrl: String
  }
}
