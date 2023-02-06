//
//  PhotoListCollectionViewCell.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import UIKit

final class PhotoListCollectionViewCell: BaseCollectionViewCell {
    
    private let photoImage = PhotoImageView(type: .photo)
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImage.image = nil
    }
    
    override func configure() {
        contentView.addSubview(photoImage)
    }
    
    override func setConstraints() {
        photoImage.snp.makeConstraints {
            $0.edges.equalTo(safeAreaLayoutGuide)
        }
    }
}

