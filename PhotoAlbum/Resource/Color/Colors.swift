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
    
    var color: UIColor {
        switch self {
        case .black: return UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        case .white: return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        }
    }
}
