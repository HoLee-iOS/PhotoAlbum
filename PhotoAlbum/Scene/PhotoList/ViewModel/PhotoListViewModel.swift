//
//  PhotoListViewModel.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import Foundation
import Photos

final class PhotoListViewModel {
    
    var data: PhotoListDataModel?
    var photos: PHFetchResult<PHAsset>
    
    init(_ album:PHAssetCollection?) {
        let option = PHFetchOptions()
        //MARK: - 최근 이미지 순 정렬
        option.sortDescriptors = [NSSortDescriptor(key: TextCase.option.rawValue, ascending: false)]
        photos = PHAsset.fetchAssets(in: album ?? PHAssetCollection(), options: option)
    }
    
    func configure(_ indexPath:Int) -> PhotoListDataModel? {
        let photo = photos.object(at: indexPath)
        let resource = PHAssetResource.assetResources(for: photo).first
        let fileName = resource?.originalFilename
        let fileValue = resource?.value(forKey: TextCase.PhotoList.fileSize.rawValue) as? UInt64
        let fileSize = String(format: "%.1f", Double(fileValue ?? 0) / (1024.0*1024.0))+" MB"
        
        data = PhotoListDataModel(photo: photo, title: fileName, size: fileSize)
        return data
    }
}

