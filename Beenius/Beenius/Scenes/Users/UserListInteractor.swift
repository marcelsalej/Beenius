//
//  UserListInteractor.swift
//  Beenius
//
//  Created by Marcel Salej on 09/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol UserListBusinessLogic {
  func fetchUserList()
}

class UserListInteractor {
  lazy var userService: UserService = .init()
  var presenter: UserListPresentationLogic?
}

// MARK: - Business Logic
extension UserListInteractor: UserListBusinessLogic {
  func fetchUserList() {
    userService.getUsersList { [weak self] result in
      self?.presenter?.presentUserList(result: result)
    }
  }
}
