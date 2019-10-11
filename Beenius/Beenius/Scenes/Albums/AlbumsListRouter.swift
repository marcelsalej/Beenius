//
//  AlbumsListRouter.swift
//  Beenius
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol AlbumsListRoutingLogic {
  func navigateToPhotos(user: User, selectedAlbum: AlbumsListViewController.ViewModel)
}

protocol AlbumsListRouterDelegate: AnyObject {
}

class AlbumsListRouter {
  weak var viewController: AlbumsListViewController?
  weak var delegate: AlbumsListRouterDelegate?
}

// MARK: - Routing Logic
extension AlbumsListRouter: AlbumsListRoutingLogic {
  func navigateToPhotos(user: User, selectedAlbum: AlbumsListViewController.ViewModel) {
    // TODO: - Load next controller
  }
}
