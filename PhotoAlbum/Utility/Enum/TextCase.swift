//
//  TextCase.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import Foundation

/// 앱에서 사용하는 raw한 값들을 용도나 화면 별로 모아놓은 enum
enum TextCase {
    
    static let option = "creationDate"
    
    enum Authorization {
        static let title = "사진정보 이용"
        static let message = "사진의 상세데이터를 제공을 위해 사진 접근에 대한 권한을 허용해야만 앱을 사용하실 수 있습니다."
        static let response = "설정으로 이동"
        static let quit = "종료"
    }
    
    enum AddAlert {
        static let title = ""
        static let message = "모든 사진에 대한 접근 허용으로 추가 가능한 사진이 없습니다."
        static let response = "확인"
    }
    
    enum AlbumList {
        static let empty = "0"
        static let navigationTitle = "앨범"
    }
    
    enum PhotoList {
        static let fileSize = "fileSize"
        static let empty = "사진 또는 비디오 없음"
    }
    
    enum DetailAlert {
        static let title = "사진정보"
        static let fileName = "파일명 : "
        static let fileSize = "\n파일 크기 : "
        static let response = "확인"
    }
}
