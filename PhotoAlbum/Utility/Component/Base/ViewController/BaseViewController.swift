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
}
