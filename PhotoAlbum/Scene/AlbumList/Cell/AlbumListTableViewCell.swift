//
//  AlbumListTableViewCell.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/05.
//

import UIKit

final class AlbumListTableViewCell: BaseTableViewCell {
    
    private let thumbnailView = PhotoImageView(color: Colors.gray.color, type: .photo)
    
    private let titleLabel = AlbumListLabel(size: 17)
    
    private let countLabel = AlbumListLabel(size: 12)
    
    private let nextPage = PhotoImageView(name: Images.AlbumList.arrow.rawValue, color: Colors.black.color, type: .album)
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailView.image = nil
        titleLabel.text = nil
        countLabel.text = nil
    }
    
    override func configure() {
        [thumbnailView, titleLabel, countLabel, nextPage].forEach{ contentView.addSubview($0) }
    }
    
    override func setConstraints() {
        thumbnailView.snp.makeConstraints {
            $0.size.equalTo(70)
            $0.leading.equalTo(safeAreaLayoutGuide).inset(8)
            $0.centerY.equalTo(safeAreaLayoutGuide)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(thumbnailView.snp.trailing).offset(16)
            $0.bottom.equalTo(thumbnailView.snp.centerY)
        }
        
        countLabel.snp.makeConstraints {
            $0.leading.equalTo(thumbnailView.snp.trailing).offset(16)
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
        
        nextPage.snp.makeConstraints {
            $0.centerY.equalTo(safeAreaLayoutGuide)
            $0.trailing.equalTo(safeAreaLayoutGuide).inset(20)
        }
    }
    
    func bindData(_ data:AlbumListDataModel?) {
        thumbnailView.image = data?.count == TextCase.AlbumList.empty.rawValue ? UIImage(systemName: Images.AlbumList.empty.rawValue) : data?.thumbnail
        titleLabel.text = data?.title
        countLabel.text = data?.count
    }
}
