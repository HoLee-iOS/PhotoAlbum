//
//  AlbumListTableViewCell.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/05.
//

import UIKit

final class AlbumListTableViewCell: BaseTableViewCell {
    
    private let thumbnailView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        return view
    }()
    
    private let titleLabel = AlbumListLabel(size: 17)
    
    private let countLabel = AlbumListLabel(size: 12)
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailView.image = nil
        titleLabel.text = nil
        countLabel.text = nil
    }
    
    override func configure() {
        [thumbnailView, titleLabel, countLabel].forEach{ contentView.addSubview($0) }
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
    }
    
    func bindData(_ data:AlbumListDataModel?) {
        thumbnailView.image = data?.thumbnail
        titleLabel.text = data?.title
        countLabel.text = data?.count
    }
}
