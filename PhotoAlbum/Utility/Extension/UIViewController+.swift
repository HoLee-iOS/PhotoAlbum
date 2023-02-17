//
//  UIViewController+.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import UIKit

extension UIViewController {
    
    /// 화면 전환을 어떤 방식으로 할지에 따른 case 분류
    enum TransitionStyle {
        case present
        case push
    }
    
    /// 화면 전환 메서드
    /// ```
    /// transition(LaunchViewController(), transitionStyle: .push)
    /// ```
    func transition(_ vc: UIViewController, transitionStyle: TransitionStyle) {
        switch transitionStyle {
        case .present:
            self.present(vc, animated: true)
        case .push:
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
