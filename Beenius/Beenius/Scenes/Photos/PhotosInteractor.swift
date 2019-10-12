//
//  PhotosInteractor.swift
//  Beenius
//
//  Created by Marcel Salej on 11/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol PhotosBusinessLogic {
  func fetchPhotos(albumId: Int)
}

class PhotosInteractor {
  var presenter: PhotosPresentationLogic?
  private let photosService: PhotosService =  .init()
}

// MARK: - Business Logic
extension PhotosInteractor: PhotosBusinessLogic {
  func fetchPhotos(albumId: Int) {
    photosService.getPhotoList { [weak self] result in
      self?.presenter?.presentPhotos(result, for: albumId)
    }
  }
}
