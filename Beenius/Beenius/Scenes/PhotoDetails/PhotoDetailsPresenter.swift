//
//  PhotoDetailsPresenter.swift
//  Beenius
//
//  Created by Marcel Salej on 12/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol PhotoDetailsPresentationLogic {
}

class PhotoDetailsPresenter {
  weak var viewController: PhotoDetailsDisplayLogic?
}

// MARK: - Presentation Logic
extension PhotoDetailsPresenter: PhotoDetailsPresentationLogic {
}
