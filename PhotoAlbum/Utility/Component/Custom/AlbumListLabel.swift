//
//  AlbumListLabel.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import UIKit

/// Label를 좀 더 적은 코드로 생성하기 위한 SubClass
/// ```
/// let label = AlbumListLabel(size: 15, width: .semibold, content: "원하는 내용")
/// ```
final class AlbumListLabel: UILabel {
    
    init(size: CGFloat, width: UIFont.Weight = .regular, content: String = "") {
        super.init(frame: .zero)
        configure(size: size, width: width, content: content)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(size: CGFloat, width: UIFont.Weight, content: String) {
        text = content
        textColor = UIColor(Colors.black) 
        font = .systemFont(ofSize: size, weight: width)
    }
}
