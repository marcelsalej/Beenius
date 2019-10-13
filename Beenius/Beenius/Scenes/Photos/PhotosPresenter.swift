//
//  PhotosPresenter.swift
//  Beenius
//
//  Created by Marcel Salej on 11/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol PhotosPresentationLogic {
  func presentPhotos(_ result: Result<[Photo], NetworkError>, for albumId: Int)
}

class PhotosPresenter {
  weak var viewController: PhotosDisplayLogic?
}

// MARK: - Presentation Logic
extension PhotosPresenter: PhotosPresentationLogic {
  func presentPhotos(_ result: Result<[Photo], NetworkError>, for albumId: Int) {
    switch result {
    case .success(let photos):
      let photosToShow = photos.filter { $0.albumId == albumId }
      let sortedPhotos = photosToShow.sorted { $0.title < $1.title }
      viewController?.displayFetchPhotosSuccess(photos: sortedPhotos)
    case .failure(let error):
      viewController?.displayFetchPhotosError(error: error)
    }
  }
}
