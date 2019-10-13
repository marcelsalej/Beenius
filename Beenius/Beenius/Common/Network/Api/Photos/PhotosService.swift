//
//  PhotosService.swift
//  Beenius
//
//  Created by Marcel Salej on 11/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

class PhotosService {
  private let photosDownloader: PhotosDownloader
  
  init(photosDownloader: PhotosDownloader = .init()) {
    self.photosDownloader = photosDownloader
  }
}

// MARK: - Service implementation
extension PhotosService {
  func getPhotoList(completion: @escaping ((Result<[Photo], NetworkError>) -> Void)) {
    // this is a great place to add localstorage/CoreData/Realm datastore implementation (inside loadUsersList of course)
    photosDownloader.loadPhotosList(completion: completion)
  }
}
