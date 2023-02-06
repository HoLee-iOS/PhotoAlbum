//
//  PhotoImageView.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import UIKit

final class PhotoImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(name:String? = nil, color:UIColor? = nil,  type:ImageViewType) {
        self.init(frame: .zero)
        configure(name: name, color: color, type: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(name:String?, color:UIColor?,  type:ImageViewType) {
        image = UIImage(systemName: name ?? "")
        tintColor = color
        switch type {
        case .photo: contentMode = .scaleToFill
        case .album: contentMode = .scaleAspectFit
        }
    }
}
