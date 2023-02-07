//
//  TextCase.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import Foundation

enum TextCase: String {
    
    case option = "creationDate"
    
    enum Authorization: String {
        case title = "사진정보 이용"
        case message = "사진의 상세데이터를 제공을 위해 사진 접근에 대한 권한을 허용해야만 앱을 사용하실 수 있습니다."
        case response = "설정으로 이동"
        case quit = "종료"
    }
    
    enum AddAlert: String {
        case title = ""
        case message = "모든 사진에 대한 접근 허용으로 모든 사진의 정보가 있습니다."
        case response = "확인"
    }
    
    enum AlbumList: String {
        case empty = "0"
        case navigationTitle = "앨범"
    }
    
    enum PhotoList: String {
        case fileSize = "fileSize"
        case empty = "사진 또는 비디오 없음"
    }
    
    enum DetailAlert: String {
        case title = "사진정보"
        case fileName = "파일명 : "
        case fileSize = "\n파일 크기 : "
        case response = "확인"
    }
}
