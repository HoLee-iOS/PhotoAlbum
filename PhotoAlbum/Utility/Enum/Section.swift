//
//  Section.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import Foundation

enum Section: Int, CaseIterable {
    case smartAlbums
    case userAlbums
    
    var header: String {
        switch self {
        case .smartAlbums: return "스마트 앨범"
        case .userAlbums: return "사용자 앨범"
        }
    }
}
