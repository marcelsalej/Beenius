//
//  PhotosRouter.swift
//  Beenius
//
//  Created by Marcel Salej on 11/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol PhotosRoutingLogic {
}

protocol PhotosRouterDelegate: AnyObject {
}

class PhotosRouter {
  weak var viewController: PhotosViewController?
  weak var delegate: PhotosRouterDelegate?
}

// MARK: - Routing Logic
extension PhotosRouter: PhotosRoutingLogic {
}
