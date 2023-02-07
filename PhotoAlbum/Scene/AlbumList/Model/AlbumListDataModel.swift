//
//  AlbumListDataModel.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import UIKit
import Photos

final class AlbumListDataModel {
    var thumbnail: PHAsset?
    var title: String?
    var count: String
    
    init(thumbnail: PHAsset?, title: String?, count: Int) {
        self.thumbnail = thumbnail
        self.title = title
        self.count = "\(count)"
    }
}
