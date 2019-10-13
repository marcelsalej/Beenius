//
//  PhotoDetailsInteractor.swift
//  Beenius
//
//  Created by Marcel Salej on 12/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import Foundation

protocol PhotoDetailsBusinessLogic {
}

class PhotoDetailsInteractor {
  var presenter: PhotoDetailsPresentationLogic?
}

// MARK: - Business Logic
extension PhotoDetailsInteractor: PhotoDetailsBusinessLogic {
}
