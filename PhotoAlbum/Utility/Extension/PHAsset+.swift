//
//  PHAsset+.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import UIKit
import Photos

extension PHAsset {
    func convertImage() -> UIImage? {
        var thumbnail: UIImage?
        PHImageManager.default().requestImage(for: self,
                             targetSize: CGSize(width: self.pixelWidth, height: self.pixelHeight),
                             contentMode: .aspectFit,
                             options: PHImageRequestOptions(),
                             resultHandler: {(result, info) -> Void in
            thumbnail = result
        })
        return thumbnail
    }
}
