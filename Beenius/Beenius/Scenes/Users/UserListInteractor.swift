//
//  UserListInteractor.swift
//  Beenius
//
//  Created by Marcel Salej on 09/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol UserListBusinessLogic {
}

class UserListInteractor {
  var presenter: UserListPresentationLogic?
}

// MARK: - Business Logic
extension UserListInteractor: UserListBusinessLogic {
}
