//
//  PhotoImageView.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import UIKit

//MARK: - 어떤 이미지를 나타낼 것인지에 따라 Case 분류
enum ImageViewType {
    case photo
    case album
}

//MARK: - ImageView를 좀 더 적은 코드로 생성하기 위한 SubClass
final class PhotoImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(name:String? = nil, color:UIColor? = nil, type:ImageViewType) {
        self.init(frame: .zero)
        configure(name: name, color: color, type: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(name:String?, color:UIColor?, type:ImageViewType) {
        image = UIImage(systemName: name ?? "")
        tintColor = color
        switch type {
        case .photo: contentMode = .scaleToFill
        case .album: contentMode = .scaleAspectFit
        }
    }
}
