//
//  NoDataView.swift
//  Beenius
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class NoDataView: UIView {
  let noDataLabel = UILabel.setupAutoLayout()
  
  // MARK: - Init methods
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupNoDataLabel()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - View setup
private extension NoDataView {
  func setupViews() {
    setupNoDataLabel()
  }
  
  func setupNoDataLabel() {
    addSubview(noDataLabel)
    noDataLabel.text = "Something went wrong. Please pull to refresh"
    noDataLabel.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
  }
}
