//
//  PhotosViewController.swift
//  Beenius
//
//  Created by Marcel Salej on 11/10/2019.
//  Copyright © 2019 Marcel Salej. All rights reserved.
//

import UIKit

protocol PhotosDisplayLogic: AnyObject {
  func displayFetchPhotosSuccess(photos: [Photo])
  func displayFetchPhotosError(error: NetworkError)
}

class PhotosViewController: UIViewController {
  var interactor: PhotosBusinessLogic?
  var router: PhotosRoutingLogic?
  private let dataSource = PhotoListDataSource()
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
    loadPhotoList()
  }
}

// MARK: - Set data
extension PhotosViewController {
  func loadPhotoList() {
    contentView.toggleLoading(true)
    interactor?.fetchPhotos(albumId: selectedAlbum.album.id)
  }
}

// MARK: - Display Logic
extension PhotosViewController: PhotosDisplayLogic {
  func displayFetchPhotosSuccess(photos: [Photo]) {
    dataSource.setData(photos: photos)
    contentView.collectionView.reloadData()
    contentView.refreshControl.endRefreshing()
    contentView.toggleLoading(false)
  }
  
  func displayFetchPhotosError(error: NetworkError) {
    dataSource.setData(photos: [])
    contentView.setupNoDataView()
    contentView.collectionView.reloadData()
    contentView.refreshControl.endRefreshing()
    contentView.toggleLoading(false)
  }
}

// MARK: - UI setup
private extension PhotosViewController {
  func setupViews() {
    setupContentView()
    setupNavigationTitle()
  }
  
  func setupNavigationTitle() {
    navigationItem.title = selectedAlbum.album.title
  }
  
  func setupContentView() {
    view.addSubview(contentView)
    contentView.backgroundColor = .white
    contentView.collectionView.dataSource = dataSource
    contentView.collectionView.delegate = self
    contentView.refreshControl.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
    contentView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}
 
// MARK: - Action handlers
extension PhotosViewController {
  @objc func didPullToRefresh() {
    interactor?.fetchPhotos(albumId: selectedAlbum.album.id)
  }
}

// MARK: - UICollectionViewDelegate
extension PhotosViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    selectedAlbum.photos[safe: indexPath.row].map {
      router?.navigateToPhotoDetails(album: selectedAlbum.album, user: user, photo: $0)
    }
  }
}
