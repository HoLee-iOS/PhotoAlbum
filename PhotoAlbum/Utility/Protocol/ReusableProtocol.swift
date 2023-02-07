//
//  ReusableProtocol.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import UIKit

//MARK: - reuseIdentifier
protocol ReusableViewProtocol: AnyObject {
    static var reuseIdentifier: String { get }
}

extension UIViewController: ReusableViewProtocol {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReusableViewProtocol {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableViewProtocol {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
