//
//  BaseTableViewCell.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import UIKit

import SnapKit

/// TableViewCell 코드의 가독성과 중복을 줄이기 위한 SubClass
class BaseTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {}
    
    func setConstraints() {}
}
