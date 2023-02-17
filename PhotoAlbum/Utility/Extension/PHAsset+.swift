//
//  PHAsset+.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import UIKit
import Photos

extension PHAsset {
    
    /// PHAsset을 UIImage로 변환
    /// ```
    /// PHAsset().convertImage { [weak self] (image) in
    ///     imageView.image = image
    /// }
    /// ```
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
