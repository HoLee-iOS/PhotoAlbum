//
//  Colors.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import UIKit

enum Colors {
    case black
    case white
    case gray
    
    var color: UIColor {
        switch self {
        case .black: return UIColor("#000000")
        case .white: return UIColor("#FFFFFF")
        case .gray: return UIColor("#DDDDDD")
        }
    }
}
