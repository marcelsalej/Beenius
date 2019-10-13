//
//  PhotosDownloader.swift
//  Beenius
//
//  Created by Marcel Salej on 11/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

class PhotosDownloader {
  private let networkClient: NetworkClient
  
  init(networkClient: NetworkClient = .init()) {
    self.networkClient = networkClient
  }
}

extension PhotosDownloader {
  func loadPhotosList(completion: @escaping ((Result<[Photo], NetworkError>) -> Void)) {
    networkClient.GET(decode: [Photo].self, endpoint: Endpoint.Photo.photoList, completion)
  }
}
