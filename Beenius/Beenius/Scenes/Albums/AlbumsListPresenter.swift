//
//  AlbumsListPresenter.swift
//  Beenius
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol AlbumsListPresentationLogic {
  func presentAlbumsList(userId: Int, result: Result<[Album], NetworkError>)
}

class AlbumsListPresenter {
  weak var viewController: AlbumsListDisplayLogic?
}

// MARK: - Presentation Logic
extension AlbumsListPresenter: AlbumsListPresentationLogic {
  func presentAlbumsList(userId: Int, result: Result<[Album], NetworkError>) {
    switch result {
    case .success(let albumList):
      let usersAlbums = albumList.filter { $0.userId == userId }
      viewController?.displayAlbumsListSuccess(albumsList: usersAlbums)
    case .failure(let error):
      viewController?.displayAlbumsListFailure(error: error)
    }
  }
}
