//
//  AlbumListViewController.swift
//  PhotoAlbum
//
//  Created by 이현호 on 2023/02/05.
//

import UIKit

final class AlbumListViewController: BaseViewController {
    
    private let viewModel = AlbumListViewModel()
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.rowHeight = 85
        view.separatorColor = Colors.white.color
        view.dataSource = self
        view.delegate = self
        view.register(AlbumListTableViewCell.self, forCellReuseIdentifier: AlbumListTableViewCell.reuseIdentifier)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configure() {
        let backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem
        navigationItem.backBarButtonItem?.tintColor = Colors.black.color
        navigationItem.title = TextCase.AlbumList.navigationTitle.rawValue
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
        Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section) {
        case .userAlbums: return viewModel.userAlbums.count
        case .smartAlbums: return viewModel.smartAlbums.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumListTableViewCell.reuseIdentifier, for: indexPath) as? AlbumListTableViewCell
        guard let cell = cell else { return UITableViewCell() }
        
        switch Section(rawValue: indexPath.section) {
        case .userAlbums: viewModel.configure(type: .userAlbums, indexPath: indexPath.row)
        case .smartAlbums: viewModel.configure(type: .smartAlbums, indexPath: indexPath.row)
        default: break
        }
        
        cell.bindData(viewModel.data)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        Section(rawValue: section)?.header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = PhotoListViewController()
        vc.album = indexPath.section == 0 ? viewModel.userAlbums.object(at: indexPath.row) : viewModel.smartAlbums.object(at: indexPath.row)
        transition(vc, transitionStyle: .push)
    }
}
