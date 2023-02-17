//
//  Section.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import Foundation

/// 앨범리스트 화면에서 스마트앨범과 사용자앨범 섹션을 나눠주는 enum
enum AlbumListSection: Int, CaseIterable {
    case smartAlbums
    case userAlbums
    
    var header: String {
        switch self {
        case .smartAlbums: return "스마트 앨범"
        case .userAlbums: return "사용자 앨범"
        }
    }
}
