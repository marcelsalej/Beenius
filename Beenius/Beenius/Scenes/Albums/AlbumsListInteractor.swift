//
//  AlbumsListInteractor.swift
//  Beenius
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol AlbumsListBusinessLogic {
  func fetchAlbumList(for userId: Int)
}

class AlbumsListInteractor {
  var presenter: AlbumsListPresentationLogic?
  lazy var albumsService: AlbumsService = .init()
}

// MARK: - Business Logic
extension AlbumsListInteractor: AlbumsListBusinessLogic {
  func fetchAlbumList(for userId: Int) {
    albumsService.getAlbumsList { [weak self] result in
      self?.presenter?.presentAlbumsList(userId: userId, result: result)
    }
  }
}
