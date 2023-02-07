//
//  BaseViewController.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import UIKit

import SnapKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.white.color
        configure()
        setConstraints()
    }
    
    func configure() { }
    
    func setConstraints() { }
    
    //MARK: - Alert 생성
    func showAlert(type:AlertType = .one, title:String, message:String, response:String, completion: (() -> Void)? = nil) {
        let requestAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: response, style: .default) { _ in
            completion?()
        }
        let cancel = UIAlertAction(title: TextCase.Authorization.quit.rawValue, style: .destructive) { _ in
            UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
            DispatchQueue.main.async {
                exit(0)
            }
        }
        if type == .two { requestAlert.addAction(cancel) }
        requestAlert.addAction(ok)
        transition(requestAlert, transitionStyle: .present)
    }
}
