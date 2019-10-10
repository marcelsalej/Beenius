//
//  UserListRouter.swift
//  Beenius
//
//  Created by Marcel Salej on 09/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol UserListRoutingLogic {
}

protocol UserListRouterDelegate: AnyObject {
}

class UserListRouter {
  weak var viewController: UserListViewController?
  weak var delegate: UserListRouterDelegate?
}

// MARK: - Routing Logic
extension UserListRouter: UserListRoutingLogic {
}
