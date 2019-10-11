//
//  AlbumsListPresenter.swift
//  Beenius
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol AlbumsListPresentationLogic {
  func presentAlbumsList(userId: Int, albums: [Album], photos: [Photo])
}

class AlbumsListPresenter {
  weak var viewController: AlbumsListDisplayLogic?
}

// MARK: - Presentation Logic
extension AlbumsListPresenter: AlbumsListPresentationLogic {
  func presentAlbumsList(userId: Int, albums: [Album], photos: [Photo]) {
    let selectedUserAlbums = albums.filter { $0.userId == userId }
    let viewModels: [AlbumsListViewController.ViewModel] = selectedUserAlbums.map { album in
      .init(album: album, photos: photos.filter { $0.albumId == album.id}) 
    }
    switch viewModels.isEmpty {
    case true:
      viewController?.displayAlbumsListFailure(error: .noData)
    case false:
      viewController?.displayAlbumsListSuccess(viewModels: viewModels)
    }
  }
}
