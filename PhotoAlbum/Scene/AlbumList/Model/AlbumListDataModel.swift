//
//  AlbumListDataModel.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import UIKit

final class AlbumListDataModel {
    var thumbnail: UIImage?
    var title: String?
    var count: String
    
    init(thumbnail: UIImage?, title: String?, count: Int) {
        self.thumbnail = thumbnail
        self.title = title
        self.count = "\(count)"
    }
}
