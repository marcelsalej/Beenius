//
//  AlbumsListInteractor.swift
//  Beenius
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol AlbumsListBusinessLogic {
}

class AlbumsListInteractor {
  var presenter: AlbumsListPresentationLogic?
}

// MARK: - Business Logic
extension AlbumsListInteractor: AlbumsListBusinessLogic {
}
