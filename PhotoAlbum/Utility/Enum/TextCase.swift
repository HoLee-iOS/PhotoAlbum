//
//  TextCase.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import Foundation

enum TextCase: String {
    
    case option = "creationDate"
    
    enum AlbumList: String {
        case empty = "0"
        case navigationTitle = "앨범"
    }
    
    enum PhotoList: String {
        case fileSize = "fileSize"
    }
    
    enum Alert: String {
        case title = "사진정보"
        case fileName = "파일명 : "
        case fileSize = "\n파일 크기 : "
        case ok = "확인"
    }
}
