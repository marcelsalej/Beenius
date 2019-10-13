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
  private var isTapped: Bool = false
  
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
    setDetailsData()
  }
}

// MARK: - Display Logic
extension PhotoDetailsViewController: PhotoDetailsDisplayLogic {
}

// MARK: - Set data
private extension PhotoDetailsViewController {
  func setDetailsData() {
    contentView.fullScreenImageView.kf.setImage(with: URL(string: photo.url))
    contentView.photoDetailView.setData(.init(thumbnailUrl: photo.thumbnailUrl,
                                              imageTitle: photo.title,
                                              albumTitle: album.title,
                                              userCreate: user.name))
  }
}

// MARK: - Actions
extension PhotoDetailsViewController {
  @objc func didTapFullScreenImageView() {
    self.isTapped = !isTapped
    hideHeaderFooter(imageTapped: isTapped)
  }
}

// MARK: - Setup UI
private extension PhotoDetailsViewController {
  func setupViews() {
    setupContentView()
    setupNavigationTitle()
  }
  
  func setupNavigationTitle() {
    navigationItem.title = photo.title
  }
  
  func setupContentView() {
    view.addSubview(contentView)
    contentView.fullScreenImageView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                                action: #selector(didTapFullScreenImageView)))
    contentView.fullScreenImageView.isUserInteractionEnabled = true
    contentView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  func hideHeaderFooter(imageTapped: Bool) {
    self.navigationController?.setNavigationBarHidden(isTapped, animated: true)
    UIView.animate(withDuration: 0.3) {
      let transformValue = self.isTapped ? self.contentView.photoDetailView.frame.height : 0
      self.contentView.photoDetailView.transform = CGAffineTransform(translationX: 0,
                                                                     y: transformValue)
    }
  }
}
