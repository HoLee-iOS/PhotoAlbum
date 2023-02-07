//
//  PHAsset+.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import UIKit
import Photos

extension PHAsset {
    
    //MARK: - PHAsset을 UIImage로 변환
    func convertImage(completion: ((UIImage?)->())?) {
        PHImageManager().requestImage(for: self,
                                      targetSize: CGSize(width: self.pixelWidth, height: self.pixelHeight),
                                      contentMode: .aspectFit,
                                      options: PHImageRequestOptions(),
                                      resultHandler: {(result, info) -> Void in
            completion?(result)
        })
    }
}
