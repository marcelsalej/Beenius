//
//  UserListRouter.swift
//  Beenius
//
//  Created by Marcel Salej on 09/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol UserListRoutingLogic {
  func navigateToAlbumList(for user: User)
}

protocol UserListRouterDelegate: AnyObject {
}

class UserListRouter {
  weak var viewController: UserListViewController?
  weak var delegate: UserListRouterDelegate?
}

// MARK: - Routing Logic
extension UserListRouter: UserListRoutingLogic {
  func navigateToAlbumList(for user: User) {
    let albumsListViewController = AlbumsListViewController(delegate: self, user: user)
    viewController?.navigationController?.pushViewController(albumsListViewController, animated: true)
  }
}

extension UserListRouter: AlbumsListRouterDelegate {
}
