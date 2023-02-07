//
//  PhotoListCollectionViewCell.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import UIKit

final class PhotoListCollectionViewCell: BaseCollectionViewCell {
    
    private let photoImage = PhotoImageView(type: .photo)
    
    //MARK: - 재사용 에러를 방지하기 위한 초기값 설정
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
    
    func bindData(_ data:PhotoListDataModel?) {
        data?.photo?.convertImage { [weak self] (image) in
            self?.photoImage.image = image
        }
    }
}

