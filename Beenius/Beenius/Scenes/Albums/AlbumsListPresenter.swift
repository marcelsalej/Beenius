//
//  AlbumsListPresenter.swift
//  Beenius
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol AlbumsListPresentationLogic {
}

class AlbumsListPresenter {
  weak var viewController: AlbumsListDisplayLogic?
}

// MARK: - Presentation Logic
extension AlbumsListPresenter: AlbumsListPresentationLogic {
}
