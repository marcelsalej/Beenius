//
//  AlbumTableViewCell.swift
//  Beenius
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
  // MARK: - Lifecycle
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
  }
}

// MARK: - UI Setup
private extension AlbumTableViewCell {
  func setupViews() {
  }
}

// MARK: - ViewModel
extension AlbumTableViewCell {
  struct ViewModel {
  }
}
