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
    
    func showAlert(title:String, message:String, response:String, completion: (() -> Void)? = nil) {
        let requestAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let goSetting = UIAlertAction(title: response, style: .default) { _ in
            completion?()
        }
        requestAlert.addAction(goSetting)
        transition(requestAlert, transitionStyle: .present)
    }
}
