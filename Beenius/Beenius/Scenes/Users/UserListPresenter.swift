//
//  UserListPresenter.swift
//  Beenius
//
//  Created by Marcel Salej on 09/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol UserListPresentationLogic {
  
}

class UserListPresenter {
  weak var viewController: UserListDisplayLogic?
}

// MARK: - Presentation Logic
extension UserListPresenter: UserListPresentationLogic {
  
}
