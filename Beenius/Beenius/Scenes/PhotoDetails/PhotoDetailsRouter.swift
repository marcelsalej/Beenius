//
//  PhotoDetailsRouter.swift
//  Beenius
//
//  Created by Marcel Salej on 12/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol PhotoDetailsRoutingLogic {
}

protocol PhotoDetailsRouterDelegate: AnyObject {
}

class PhotoDetailsRouter {
  weak var viewController: PhotoDetailsViewController?
  weak var delegate: PhotoDetailsRouterDelegate?
}

// MARK: - Routing Logic
extension PhotoDetailsRouter: PhotoDetailsRoutingLogic {
}
