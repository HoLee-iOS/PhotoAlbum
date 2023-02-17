//
//  SceneDelegate.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/05.
//

import UIKit
import Photos

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        //네비게이션 아이템 색상 설정
        UINavigationBar.appearance().tintColor = UIColor(Colors.black)
        
        //초기화면 설정
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.rootViewController = LaunchViewController()
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        //권한 설정 변경 없이 화면으로 돌아갔을때 권한 확인 후 다시 Alert Present
        if PHPhotoLibrary.authorizationStatus(for: .readWrite) == .denied {
            let requestAlert = UIAlertController(title: TextCase.Authorization.title, message: TextCase.Authorization.message, preferredStyle: .alert)
            let goSetting = UIAlertAction(title: TextCase.Authorization.response, style: .default) { _ in
                if let appSetting = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(appSetting)
                }
            }
            let cancel = UIAlertAction(title: TextCase.Authorization.quit, style: .destructive) { _ in
                UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
                DispatchQueue.main.async {
                    exit(0)
                }
            }
            requestAlert.addAction(cancel)
            requestAlert.addAction(goSetting)
            self.window?.rootViewController?.present(requestAlert, animated: true)
        }
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

