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
        let options = PHImageRequestOptions()
        options.isSynchronous = true
        PHImageManager.default().requestImage(for: self,
                                              targetSize: CGSize(width: self.pixelWidth, height: self.pixelHeight),
                                              contentMode: .aspectFit,
                                              options: options,
                                              resultHandler: {(result, info) -> Void in
            thumbnail = result
        })
        return thumbnail
    }
}
