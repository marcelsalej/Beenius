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
  lazy var photoService: PhotosService = .init()
  private var albums = [Album]()
  private var photos = [Photo]()
}

// MARK: - Business Logic
extension AlbumsListInteractor: AlbumsListBusinessLogic {
  func fetchAlbumList(for userId: Int) {
   let dispatchGroup = DispatchGroup()
    loadAlbums(dispatchGroup: dispatchGroup)
    loadPhotos(dispatchGroup: dispatchGroup)
    dispatchGroup.notify(queue: .main) {
      self.presenter?.presentAlbumsList(userId: userId,
                                        albums: self.albums,
                                        photos: self.photos)
    }
  }
}

private extension AlbumsListInteractor {
  func loadAlbums(dispatchGroup: DispatchGroup) {
    dispatchGroup.enter()
    albumsService.getAlbumsList { [weak self] result in
      switch result {
      case .success(let albumList):
        self?.albums.append(contentsOf: albumList)
        dispatchGroup.leave()
      case .failure:
        //present error
        dispatchGroup.leave()
      }
    }
  }
  
  func loadPhotos(dispatchGroup: DispatchGroup) {
    dispatchGroup.enter()
    photoService.getPhotoList { [weak self] result in
      switch result {
      case .success(let photoList):
        self?.photos.append(contentsOf: photoList)
        dispatchGroup.leave()
      case .failure:
        dispatchGroup.leave()
      }
    }
  }
}
