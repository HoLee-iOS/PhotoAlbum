//
//  AlbumListLabel.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import UIKit

final class AlbumListLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(size: CGFloat) {
        self.init(frame: .zero)
        configure(size: size)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(size: CGFloat) {
        textColor = Colors.black.color
        font = .systemFont(ofSize: size, weight: .regular)
    }
}
