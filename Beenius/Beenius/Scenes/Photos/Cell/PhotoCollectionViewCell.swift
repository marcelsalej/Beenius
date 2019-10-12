//
//  PhotoCollectionViewCell.swift
//  Beenius
//
//  Created by Marcel Salej on 11/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
  private let photoImageView = UIImageView.setupAutoLayout()
  private let photoCaptionVisualEffectView = UIVisualEffectView.setupAutoLayout()
  private let captionTextLabel = UILabel.setupAutoLayout()
  
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
    photoImageView.kf.setImage(with: URL(string: model.photoUrl))
    captionTextLabel.text = model.photoDescription
  }
}

// MARK: - UI setup
private extension PhotoCollectionViewCell {
  func setupViews() {
    setupPhotoImageView()
    setupPhotoCaptionView()
    setupCaptionTextLabel()
  }
  
  func setupPhotoImageView() {
   addSubview(photoImageView)
    photoImageView.contentMode = .scaleAspectFit
    photoImageView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  func setupPhotoCaptionView() {
    photoCaptionVisualEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    photoCaptionVisualEffectView.effect = UIBlurEffect(style: .dark)
    photoImageView.insertSubview(photoCaptionVisualEffectView, aboveSubview: photoImageView)
    photoCaptionVisualEffectView.snp.makeConstraints {
      $0.bottom.leading.trailing.equalToSuperview()
      $0.height.equalTo(photoImageView.snp.height).multipliedBy(0.5)
    }
  }
  
  func setupCaptionTextLabel() {
    photoCaptionVisualEffectView.contentView.addSubview(captionTextLabel)
    captionTextLabel.font = UIFont.custom(style: .bookItalic, size: 12)
    captionTextLabel.text = "test"
    captionTextLabel.textColor = .white
    captionTextLabel.numberOfLines = 0
    captionTextLabel.textAlignment = .center
    captionTextLabel.minimumScaleFactor = 0.5
    captionTextLabel.adjustsFontSizeToFitWidth = true
    captionTextLabel.snp.makeConstraints {
      $0.top.bottom.leading.trailing.equalToSuperview().inset(20)
    }
  }
}

extension PhotoCollectionViewCell {
  struct ViewModel {
    let photoUrl: String
    let photoDescription: String
  }
}
