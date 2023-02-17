//
//  PhotoListViewController.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/06.
//

import UIKit
import Photos

final class PhotoListViewController: BaseViewController, PHPhotoLibraryChangeObserver {
    
    var album: PHAssetCollection?
    
    private lazy var viewModel = PhotoListViewModel(album)
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.dataSource = self
        view.delegate = self
        view.register(PhotoListCollectionViewCell.self, forCellWithReuseIdentifier: PhotoListCollectionViewCell.reuseIdentifier)
        return view
    }()
    
    private let emptyLabel = AlbumListLabel(size: 20, width: .semibold, content: TextCase.PhotoList.empty)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isEmptyAlbum()
        //변경사항 감지하는 Observer에 화면 등록
        PHPhotoLibrary.shared().register(self)
    }
    
    //사진 개수가 없을 경우 emptyLabel 표시
    func isEmptyAlbum() {
        viewModel.photos.count == 0 ? (collectionView.isHidden = true) : (emptyLabel.isHidden = true)
    }
    
    //변경사항 발생 시에 실행
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        viewModel = PhotoListViewModel(album)
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    override func configure() {
        navigationItem.title = album?.localizedTitle
        [collectionView, emptyLabel].forEach { view.addSubview($0) }
    }
    
    override func setConstraints() {
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        emptyLabel.snp.makeConstraints {
            $0.center.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    //compositionalLayout 설정
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
        showAlert(title: TextCase.DetailAlert.title, message: TextCase.DetailAlert.fileName + data.title + TextCase.DetailAlert.fileSize + data.size, response: TextCase.DetailAlert.response)
    }
}
