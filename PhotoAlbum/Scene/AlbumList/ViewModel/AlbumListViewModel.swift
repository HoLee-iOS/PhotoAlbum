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
    var userAlbums: PHFetchResult<PHAssetCollection>!
    var smartAlbums: PHFetchResult<PHAssetCollection>!
    
    init() {
        userAlbums = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .albumRegular, options: nil)
        smartAlbums = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .albumRegular, options: nil)
    }
    
    func configure(type: Section, indexPath:Int) {
        let collection = type.rawValue == 0 ? userAlbums.object(at: indexPath) : smartAlbums.object(at: indexPath)
        let option = PHFetchOptions()
        option.sortDescriptors = [NSSortDescriptor(key: TextCase.option.rawValue, ascending: false)]
        let fetchAssets = PHAsset.fetchAssets(in: collection, options: option)
        data = AlbumListDataModel(thumbnail: fetchAssets.firstObject?.convertImage(), title: collection.localizedTitle, count: fetchAssets.count)
    }
}
