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
  private let dataSource = UsersListDataSourceDataSource()
  
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
    // TODO: - Show error
    print("Error user list")
  }
  
  func displayUserListSuccess(users: [User]) {
    dataSource.setData(users: users)
    contentView.tableView.reloadData()
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
    setupNavigationHeader()
    setupContentView()
  }
  
  func setupNavigationHeader() {
    // TODO: - Move to localization
    navigationItem.title = "Users"
  }
  
  func setupContentView() {
    view.addSubview(contentView)
    contentView.backgroundColor = .white
    contentView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}
