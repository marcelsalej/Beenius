//
//  PhotoListDataSource.swift
//  Beenius
//
//  Created by Marcel Salej on 11/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

class PhotoListDataSource: NSObject, DataSourceProtocol {
  var sections: [PhotoListSection] = []
}

// MARK: - Public Methods
extension PhotoListDataSource {
  func setData(photos: [Photo]) {
    let photoRows: [PhotoListRow] = photos.map { .photo(.init(photoUrl: $0.url,
                                                              photoDescription: $0.title))}
    sections.append(.photoList(rows: photoRows))
  }
}

// MARK: - UITableView DataSource
extension PhotoListDataSource: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return numberOfRows(in: section)
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let row = section(at: indexPath.section)?.row(at: indexPath.row) else {
      Logger.error("No available row in dataSource at given indexPath \(indexPath)!")
      return UICollectionViewCell()
    }
    switch row {
    case .photo(let model):
      let cell = collectionView.dequeueReusableCell(PhotoCollectionViewCell.self, at: indexPath)
      cell.setData(model: model)
      return cell
    }
  }
}
