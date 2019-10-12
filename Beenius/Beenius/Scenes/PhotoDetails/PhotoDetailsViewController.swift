//
//  PhotoDetailsViewController.swift
//  Beenius
//
//  Created by Marcel Salej on 12/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

protocol PhotoDetailsDisplayLogic: AnyObject {
}

class PhotoDetailsViewController: UIViewController {
  var interactor: PhotoDetailsBusinessLogic?
  var router: PhotoDetailsRoutingLogic?
  private lazy var contentView = PhotoDetailsContentView.setupAutoLayout()
  private let user: User
  private let album: Album
  private let photo: Photo
  
  init(delegate: PhotoDetailsRouterDelegate?, user: User, album: Album, photo: Photo) {
    self.user = user
    self.album = album
    self.photo = photo
    super.init(nibName: nil, bundle: nil)
    let interactor = PhotoDetailsInteractor()
    let presenter = PhotoDetailsPresenter()
    let router = PhotoDetailsRouter()
    interactor.presenter = presenter
    presenter.viewController = self
    router.viewController = self
    router.delegate = delegate
    self.interactor = interactor
    self.router = router
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }
}

// MARK: - Display Logic
extension PhotoDetailsViewController: PhotoDetailsDisplayLogic {
}

// MARK: - Private Methods
private extension PhotoDetailsViewController {
  func setupViews() {
    // setup title, background, navigation buttons, etc
    setupContentView()
  }
  
  func setupContentView() {
    view.addSubview(contentView)
    // add constraints
  }
}
