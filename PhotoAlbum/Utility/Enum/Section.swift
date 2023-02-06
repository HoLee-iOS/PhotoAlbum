//
//  Section.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import Foundation

enum Section: Int, CaseIterable {
    case userAlbums
    case smartAlbums
    
    var header: String {
        switch self {
        case .userAlbums: return "사용자 앨범"
        case .smartAlbums: return "스마트 앨범"
        }
    }
}
