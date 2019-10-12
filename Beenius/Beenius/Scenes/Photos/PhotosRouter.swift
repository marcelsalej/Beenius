//
//  PhotosRouter.swift
//  Beenius
//
//  Created by Marcel Salej on 11/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol PhotosRoutingLogic {
  func navigateToPhotoDetails(album: Album, user: User, photo: Photo)
}

protocol PhotosRouterDelegate: AnyObject {
}

class PhotosRouter {
  weak var viewController: PhotosViewController?
  weak var delegate: PhotosRouterDelegate?
}

// MARK: - Routing Logic
extension PhotosRouter: PhotosRoutingLogic {
  func navigateToPhotoDetails(album: Album, user: User, photo: Photo) {
    let photoDetailsViewController = PhotoDetailsViewController(delegate: self, user: user, album: album, photo: photo)
    viewController?.navigationController?.pushViewController(photoDetailsViewController, animated: true)
  }
}

extension PhotosRouter: PhotoDetailsRouterDelegate {}
