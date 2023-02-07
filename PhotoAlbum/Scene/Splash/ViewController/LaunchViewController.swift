//
//  LaunchViewController.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/07.
//

import UIKit

final class LaunchViewController: BaseViewController {
    
    private let launchIcon = UIImageView(image: UIImage(named: Images.Splash.icon.rawValue))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let sceneDelegate = windowScene?.delegate as? SceneDelegate
            let nav = UINavigationController(rootViewController: AlbumListViewController())
            sceneDelegate?.window?.rootViewController = nav
        }
    }
    
    override func configure() {
        view.addSubview(launchIcon)
    }
    
    override func setConstraints() {
        launchIcon.snp.makeConstraints {
            $0.height.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.3)
            $0.width.equalTo(launchIcon.snp.height)
            $0.center.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
