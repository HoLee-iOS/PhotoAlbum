//
//  UIViewController+.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import UIKit

extension UIViewController {
    
    enum TransitionStyle {
        case present
        case push
    }
    
    //MARK: - 화면 전환
    func transition(_ vc: UIViewController, transitionStyle: TransitionStyle) {
        switch transitionStyle {
        case .present:
            self.present(vc, animated: true)
        case .push:
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
