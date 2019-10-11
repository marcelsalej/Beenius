//
//  PhotosViewController.swift
//  Beenius
//
//  Created by Marcel Salej on 11/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

protocol PhotosDisplayLogic: AnyObject {
}

class PhotosViewController: UIViewController {
  var interactor: PhotosBusinessLogic?
  var router: PhotosRoutingLogic?
  private lazy var contentView = PhotosContentView.setupAutoLayout()
  private let user: User
  private let selectedAlbum: AlbumsListViewController.ViewModel
  
  init(delegate: PhotosRouterDelegate?, user: User, selectedAlbum: AlbumsListViewController.ViewModel) {
    self.user = user
    self.selectedAlbum = selectedAlbum
    super.init(nibName: nil, bundle: nil)
    let interactor = PhotosInteractor()
    let presenter = PhotosPresenter()
    let router = PhotosRouter()
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
extension PhotosViewController: PhotosDisplayLogic {
}

// MARK: - Private Methods
private extension PhotosViewController {
  func setupViews() {
    // setup title, background, navigation buttons, etc
    setupContentView()
    setupNavigationTitle()
  }
  
  func setupNavigationTitle() {
    navigationItem.title = selectedAlbum.album.title
  }
  
  func setupContentView() {
    view.addSubview(contentView)
    contentView.backgroundColor = .white
    contentView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}
