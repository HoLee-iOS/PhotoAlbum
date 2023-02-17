//
//  AlbumListViewController.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/05.
//

import UIKit

import Photos
import PhotosUI

final class AlbumListViewController: BaseViewController, PHPhotoLibraryChangeObserver {
    
    private var viewModel = AlbumListViewModel()
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.rowHeight = 85
        view.separatorStyle = .none
        view.dataSource = self
        view.delegate = self
        view.register(AlbumListTableViewCell.self, forCellReuseIdentifier: AlbumListTableViewCell.reuseIdentifier)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //권한 거부 했을 경우 권한 변경을 유도하는 Alert Present
        if PHPhotoLibrary.authorizationStatus(for: .readWrite) == .denied {
            showAlert(type: .oKnCancel, title: TextCase.Authorization.title, message: TextCase.Authorization.message, response: TextCase.Authorization.response) {
                if let appSetting = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(appSetting)
                }
            }
        }
        
        //변경사항 감지하는 Observer에 화면 등록
        PHPhotoLibrary.shared().register(self)
    }
    
    //변경사항 발생 시에 실행
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        viewModel = AlbumListViewModel()
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    @objc func addPhotos() {
        PHPhotoLibrary.authorizationStatus(for: .readWrite) == .limited ? PHPhotoLibrary.shared().presentLimitedLibraryPicker(from: self) : showAlert(title: TextCase.AddAlert.title, message: TextCase.AddAlert.message, response: TextCase.AddAlert.response)
    }
    
    override func configure() {
        navigationItem.title = TextCase.AlbumList.navigationTitle
        let backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem
        let addButtonItem = UIBarButtonItem(image: UIImage(systemName: Images.AlbumList.add), style: .plain, target: self, action: #selector(addPhotos))
        navigationItem.rightBarButtonItem = addButtonItem
        view.addSubview(tableView)
    }
    
    override func setConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension AlbumListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        PHPhotoLibrary.authorizationStatus(for: .readWrite) == .limited ? 1 : AlbumListSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch AlbumListSection(rawValue: section) {
        case .smartAlbums: return viewModel.smartAlbums.count
        case .userAlbums: return viewModel.userAlbums.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumListTableViewCell.reuseIdentifier, for: indexPath) as? AlbumListTableViewCell
        guard let cell = cell else { return UITableViewCell() }
        
        switch AlbumListSection(rawValue: indexPath.section) {
        case .smartAlbums: viewModel.configure(type: .smartAlbums, indexPath: indexPath.row)
        case .userAlbums: viewModel.configure(type: .userAlbums, indexPath: indexPath.row)
        default: break
        }
        
        cell.bindData(viewModel.data)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return AlbumListSection(rawValue: section)?.header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = PhotoListViewController()
        vc.album = indexPath.section == 0 ? viewModel.smartAlbums.object(at: indexPath.row) : viewModel.userAlbums.object(at: indexPath.row)
        transition(vc, transitionStyle: .push)
    }
}
