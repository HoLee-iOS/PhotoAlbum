//
//  AlbumListViewModel.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import Foundation
import Photos

class AlbumListViewModel {
    
    var data: AlbumListDataModel?
    var smartAlbums: PHFetchResult<PHAssetCollection>
    var userAlbums: PHFetchResult<PHAssetCollection>
    
    init() {
        smartAlbums = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .albumRegular, options: nil)
        userAlbums = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .albumRegular, options: nil)
    }
    
    func configure(type: AlbumListSection, indexPath:Int) {
        let collection = type.rawValue == 0 ? smartAlbums.object(at: indexPath) : userAlbums.object(at: indexPath)
        let option = PHFetchOptions()
        //최근 이미지 순 정렬
        option.sortDescriptors = [NSSortDescriptor(key: TextCase.option, ascending: false)]
        let fetchAssets = PHAsset.fetchAssets(in: collection, options: option)
        data = AlbumListDataModel(thumbnail: fetchAssets.firstObject, title: collection.localizedTitle, count: fetchAssets.count)
    }
}
