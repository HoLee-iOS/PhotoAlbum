//
//  PhotoListDataModel.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import UIKit
import Photos

final class PhotoListDataModel {
    var photo: PHAsset?
    var title: String
    var size: String
    
    init(photo: PHAsset?, title: String?, size: String) {
        self.photo = photo
        self.title = title ?? ""
        self.size = size
    }
}
