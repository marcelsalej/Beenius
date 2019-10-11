//
//  AlbumsListViewController.swift
//  Beenius
//
//  Created by Marcel Salej on 10/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

protocol AlbumsListDisplayLogic: AnyObject {
  func displayAlbumsListSuccess(albumsList: [Album])
  func displayAlbumsListFailure(error: NetworkError)
}

class AlbumsListViewController: UIViewController {
  var interactor: AlbumsListBusinessLogic?
  var router: AlbumsListRoutingLogic?
  private lazy var contentView = AlbumsListContentView.setupAutoLayout()
  private let user: User
  
  init(delegate: AlbumsListRouterDelegate?, user: User) {
    self.user = user
    super.init(nibName: nil, bundle: nil)
    let interactor = AlbumsListInteractor()
    let presenter = AlbumsListPresenter()
    let router = AlbumsListRouter()
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
    fetchUserAlbums(userId: user.id)
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
}

// MARK: - Load data
extension AlbumsListViewController {
  func fetchUserAlbums(userId: Int) {
    interactor?.fetchAlbumList(for: userId)
  }
}

// MARK: - Display Logic
extension AlbumsListViewController: AlbumsListDisplayLogic {
  func displayAlbumsListSuccess(albumsList: [Album]) {
  }
  
  func displayAlbumsListFailure(error: NetworkError) {
  }
}

// MARK: - Private Methods
private extension AlbumsListViewController {
  func setupViews() {
    // setup title, background, navigation buttons, etc
    setupContentView()
    setupNavigationBar()
  }
  
  func setupContentView() {
    view.addSubview(contentView)
    contentView.backgroundColor = .white
    contentView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  func setupNavigationBar() {
    navigationItem.title = "Albums"
  }
}
