//
//  LaunchViewController.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/07.
//

import UIKit
import Photos

final class LaunchViewController: BaseViewController {
    
    private let launchIcon = PhotoImageView(name: Images.Splash.icon.rawValue, type: .album)
    
    private let accessLevel: PHAccessLevel = .addOnly
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestAuthorization(accessLevel)
    }
    
    private func requestAuthorization(_ accessLevel:PHAccessLevel) {
        PHPhotoLibrary.requestAuthorization(for: accessLevel) { [weak self] authorizationStatus in
            switch authorizationStatus {
            case .authorized: self?.transition(AlbumListViewController(), transitionStyle: .present)
            default: self?.requestAuthorization(accessLevel)
            }
        }
    }
    
    override func configure() {
        view.addSubview(launchIcon)
    }
    
    override func setConstraints() {
        launchIcon.snp.makeConstraints {
            $0.size.equalTo(70)
            $0.center.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
