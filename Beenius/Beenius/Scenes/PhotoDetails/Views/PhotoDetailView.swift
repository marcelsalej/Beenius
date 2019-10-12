//
//  PhotoDetailView.swift
//  Beenius
//
//  Created by Marcel Salej on 12/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class PhotoDetailView: UIView {
  private let topBorderView = UIView.setupAutoLayout()
  let thumbnailImageView = UIImageView.setupAutoLayout()
  let imageTitleLabel = UILabel.setupAutoLayout()
  let albumTitleLabel = UILabel.setupAutoLayout()
  let userCreateLabel = UILabel.setupAutoLayout()
  private let bottomSeparatorView = UIView.setupAutoLayout()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setData(_ model: ViewModel) {
    thumbnailImageView.kf.setImage(with: URL(string: model.thumbnailUrl))
    imageTitleLabel.text = model.imageTitle
    imageTitleLabel.sizeToFit()
    imageTitleLabel.setNeedsDisplay()
    albumTitleLabel.text = model.albumTitle
    albumTitleLabel.sizeToFit()
    userCreateLabel.text = model.userCreate
    userCreateLabel.sizeToFit()
  }
}

// MARK: - Setup UI
private extension PhotoDetailView {
  func setupViews() {
    setupTopBorderView()
    setupThumbnailImageView()
    setupImageTitleLabel()
    setupAlbumTitleLabel()
    setupUserCreateLabel()
    setupBottomSeparatorView()
  }
  
  func setupTopBorderView() {
    addSubview(topBorderView)
    topBorderView.backgroundColor = .opaqueSeparator
    topBorderView.snp.makeConstraints {
      $0.top.equalToSuperview().inset(10)
      $0.width.equalTo(20)
      $0.height.equalTo(3)
      $0.centerX.equalToSuperview()
    }
  }
  
  func setupThumbnailImageView() {
    addSubview(thumbnailImageView)
    thumbnailImageView.contentMode = .scaleAspectFit
    thumbnailImageView.snp.makeConstraints {
      $0.top.equalTo(topBorderView.snp.bottom).offset(20)
      $0.leading.equalToSuperview().offset(20)
      $0.width.height.equalTo(100)
    }
  }
  
  func setupImageTitleLabel() {
    addSubview(imageTitleLabel)
    imageTitleLabel.font = UIFont.custom(style: .book, size: 14)
    imageTitleLabel.textColor = .black
    imageTitleLabel.numberOfLines = 0
    imageTitleLabel.lineBreakMode = .byWordWrapping
    imageTitleLabel.snp.makeConstraints {
      $0.top.equalTo(topBorderView.snp.bottom).offset(20)
      $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(10)
      $0.trailing.equalToSuperview().inset(20)
    }
  }
  
  func setupAlbumTitleLabel() {
    addSubview(albumTitleLabel)
    albumTitleLabel.font = UIFont.custom(style: .bookItalic, size: 12)
    albumTitleLabel.textColor = .gray
    albumTitleLabel.numberOfLines = 0
    albumTitleLabel.lineBreakMode = .byWordWrapping
    albumTitleLabel.snp.makeConstraints {
      $0.top.equalTo(imageTitleLabel.snp.bottom).offset(10)
      $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(10)
      $0.trailing.equalToSuperview().inset(20)
    }
  }
  
  func setupUserCreateLabel() {
    addSubview(userCreateLabel)
    userCreateLabel.font = UIFont.custom(style: .bold, size: 10)
    userCreateLabel.textColor = .gray
    userCreateLabel.numberOfLines = 0
    userCreateLabel.lineBreakMode = .byWordWrapping
    userCreateLabel.snp.makeConstraints {
      $0.top.equalTo(albumTitleLabel.snp.bottom).offset(10)
      $0.leading.equalTo(thumbnailImageView.snp.trailing).offset(10)
      $0.trailing.equalToSuperview().inset(20)
    }
  }
  
  func setupBottomSeparatorView() {
    addSubview(bottomSeparatorView)
    bottomSeparatorView.backgroundColor = .opaqueSeparator
    bottomSeparatorView.snp.makeConstraints {
      $0.top.equalTo(userCreateLabel.snp.bottom).offset(30)
      $0.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
      $0.height.equalTo(1)
      $0.leading.trailing.equalToSuperview().inset(20)
    }
  }
}

// MARK: - ViewModel
extension PhotoDetailView {
  struct ViewModel {
    let thumbnailUrl: String
    let imageTitle: String
    let albumTitle: String
    let userCreate: String
  }
}
