//
//  PhotoImageView.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import UIKit

/// ImageView를 좀 더 적은 코드로 생성하기 위한 SubClass
/// ```
/// let imageView = PhotoImageView(name: "plus", color: "#000000", type: .album)
/// ```
final class PhotoImageView: UIImageView {
    
    init(name: String? = nil, color: String? = nil, type: ImageViewType) {
        super.init(frame: .zero)
        configure(name: name, color: color, type: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(name: String?, color: String?, type: ImageViewType) {
        image = UIImage(systemName: name ?? "")
        if let color = color { tintColor = UIColor(color) }
        switch type {
        case .photo: contentMode = .scaleToFill
        case .album: contentMode = .scaleAspectFit
        }
    }
}

extension PhotoImageView {
    /// 어떤 이미지를 나타낼 것인지에 따라 Case 분류
    enum ImageViewType {
        case photo
        case album
    }
}
