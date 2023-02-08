//
//  AlbumListLabel.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import UIKit

//MARK: - Label를 좀 더 적은 코드로 생성하기 위한 SubClass
final class AlbumListLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(size: CGFloat, width: UIFont.Weight = .regular, content: String = "") {
        self.init(frame: .zero)
        configure(size: size, width: width, content: content)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(size: CGFloat, width: UIFont.Weight, content: String) {
        text = content
        textColor = Colors.black.color
        font = .systemFont(ofSize: size, weight: width)
    }
}
