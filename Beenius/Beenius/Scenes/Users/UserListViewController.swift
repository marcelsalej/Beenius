//
//  UserListViewController.swift
//  Beenius
//
//  Created by Marcel Salej on 09/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit
import SnapKit

protocol UserListDisplayLogic: AnyObject {
  func displayUserListSuccess(users: [User])
  func displayUserListError(error: NetworkError)
}

class UserListViewController: UIViewController {
  var interactor: UserListBusinessLogic?
  var router: UserListRoutingLogic?
  private lazy var contentView = UserListContentView.setupAutoLayout()
  
  // MARK: - Lifecycle
  init(delegate: UserListRouterDelegate?) {
    super.init(nibName: nil, bundle: nil)
    let interactor = UserListInteractor()
    let presenter = UserListPresenter()
    let router = UserListRouter()
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
    fetchUserList()
  }
}

// MARK: - Display Logic
extension UserListViewController: UserListDisplayLogic {
  func displayUserListError(error: NetworkError) {
    print("Error ")
  }
  
  func displayUserListSuccess(users: [User]) {
    print("Users \(users)")
  }
}

// MARK: - Load data
private extension UserListViewController {
  func fetchUserList() {
    interactor?.fetchUserList()
  }
}

// MARK: - UI Setup
private extension UserListViewController {
  func setupViews() {
    setupContentView()
  }
  
  func setupContentView() {
    view.addSubview(contentView)
    contentView.backgroundColor = .white
    contentView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}
