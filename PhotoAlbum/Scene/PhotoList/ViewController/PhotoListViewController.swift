//
//  PhotoListViewController.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import UIKit
import Photos

final class PhotoListViewController: BaseViewController {
    
    var album: PHAssetCollection?
    
    private lazy var viewModel = PhotoListViewModel(album)
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.dataSource = self
        view.delegate = self
        view.register(PhotoListCollectionViewCell.self, forCellWithReuseIdentifier: PhotoListCollectionViewCell.reuseIdentifier)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configure() {
        navigationItem.title = album?.localizedTitle
        view.addSubview(collectionView)
    }
    
    override func setConstraints() {
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    //MARK: - compositionalLayout 설정
    private func createLayout() -> UICollectionViewLayout {
        
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: .fractionalWidth(1/3))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
            let spacing = CGFloat(4)
            group.interItemSpacing = .fixed(spacing)
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = spacing
            return section
        }
    }
    
    private func showAlert(_ data: PhotoListDataModel) -> UIAlertController {
        let alert = UIAlertController(title: TextCase.Alert.title.rawValue, message: TextCase.Alert.fileName.rawValue + data.title! + TextCase.Alert.fileSize.rawValue + data.size, preferredStyle: .alert)
        let ok = UIAlertAction(title: TextCase.Alert.ok.rawValue, style: .default)
        alert.addAction(ok)
        return alert
    }
}

extension PhotoListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoListCollectionViewCell.reuseIdentifier, for: indexPath) as? PhotoListCollectionViewCell
        guard let cell = cell else { return UICollectionViewCell() }
        
        cell.bindData(viewModel.configure(indexPath.item))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let data = viewModel.configure(indexPath.item) else { return }
        transition(showAlert(data), transitionStyle: .present)
    }
}
