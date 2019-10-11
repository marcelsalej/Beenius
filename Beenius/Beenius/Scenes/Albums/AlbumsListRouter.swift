//
//  AlbumsListRouter.swift
//  Beenius
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol AlbumsListRoutingLogic {
}

protocol AlbumsListRouterDelegate: AnyObject {
}

class AlbumsListRouter {
  weak var viewController: AlbumsListViewController?
  weak var delegate: AlbumsListRouterDelegate?
}

// MARK: - Routing Logic
extension AlbumsListRouter: AlbumsListRoutingLogic {
}
