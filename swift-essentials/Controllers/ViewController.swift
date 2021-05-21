//
//  ViewController.swift
//  swift-essentials
//
//  Created by Nitesh  on 29/04/21.
//  Copyright © 2021 nitpa.org. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    let tableViewButton: UIButton = {
        let tableViewButton = UIButton()
        tableViewButton.setTitle("tableView", for: .normal)
        tableViewButton.backgroundColor = .systemBlue
        tableViewButton.addTarget(self, action: #selector(didTapTableView), for: .touchUpInside)
        return tableViewButton
    }()
    
    let collectionViewButton: UIButton = {
        let collectionViewButton = UIButton()
        collectionViewButton.setTitle("collectionView", for: .normal)
        collectionViewButton.backgroundColor = .systemBlue
        collectionViewButton.addTarget(self, action: #selector(didTapCollectionView), for: .touchUpInside)
        return collectionViewButton
    }()
    
    // MARK: - Initialisation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(tableViewButton)
        view.addSubview(collectionViewButton)
        
        tableViewButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 44)
        collectionViewButton.anchor(top: tableViewButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 44)
    }
    
    // MARK: - Handlers

    @objc fileprivate func didTapTableView() {
        let tableVC = UINavigationController(rootViewController: TableViewController())
        tableVC.modalPresentationStyle = .overCurrentContext
        present(tableVC, animated: true)
    }
    
    @objc fileprivate func didTapCollectionView() {
        let collectionVC = CollectionViewController()
        collectionVC.modalPresentationStyle = .overCurrentContext
        present(collectionVC, animated: true)
    }
}

