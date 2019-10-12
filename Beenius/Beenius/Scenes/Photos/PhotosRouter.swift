//
//  PhotosRouter.swift
//  Beenius
//
//  Created by Marcel Salej on 11/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol PhotosRoutingLogic {
  func navigateToPhotoDetails(selectedAlbum: Album, user: User, photo: Photo)
}

protocol PhotosRouterDelegate: AnyObject {
}

class PhotosRouter {
  weak var viewController: PhotosViewController?
  weak var delegate: PhotosRouterDelegate?
}

// MARK: - Routing Logic
extension PhotosRouter: PhotosRoutingLogic {
  func navigateToPhotoDetails(selectedAlbum: Album, user: User, photo: Photo) {
    // next view controller here
  }
}
