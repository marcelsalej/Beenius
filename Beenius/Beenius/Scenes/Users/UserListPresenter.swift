//
//  UserListPresenter.swift
//  Beenius
//
//  Created by Marcel Salej on 09/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol UserListPresentationLogic {
  func presentUserList(result: Result<[User], NetworkError>)
}

class UserListPresenter {
  weak var viewController: UserListDisplayLogic?
}

// MARK: - Presentation Logic
extension UserListPresenter: UserListPresentationLogic {
  func presentUserList(result: Result<[User], NetworkError>) {
    switch result {
    case .success(let users):
      viewController?.displayUserListSuccess(users: users)
    case .failure(let error):
      viewController?.displayUserListError(error: error)
    }
  }
}
