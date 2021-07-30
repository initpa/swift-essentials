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
    
    let toastButton: UIButton = {
        let toast = UIButton()
        toast.setTitle("toast", for: .normal)
        toast.backgroundColor = .systemBlue
        toast.addTarget(self, action: #selector(didTapToast), for: .touchUpInside)
        return toast
    }()
    
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
    
    let getKanyeQuote: UIButton = {
        let button = UIButton()
        button.setTitle("get kanye quote", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(didTapKanyeQuote), for: .touchUpInside)
        return button
    }()
    // MARK: - Initialisation
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("this is view did load")
        title = "Home"
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("this is view wiil appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("this is view did appear")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(tableViewButton)
        view.addSubview(collectionViewButton)
        view.addSubview(getKanyeQuote)
        view.addSubview(toastButton)
        
        tableViewButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 44)
        collectionViewButton.anchor(top: tableViewButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 44)
        getKanyeQuote.anchor(top: collectionViewButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 44)
        toastButton.anchor(top: getKanyeQuote.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 44)
        
    }
    
    // MARK: - Handlers

    @objc fileprivate func didTapTableView() {
        let tableVC = UINavigationController(rootViewController: TableViewController())
        tableVC.modalPresentationStyle = .fullScreen
        present(tableVC, animated: true)
    }
    
    @objc fileprivate func didTapCollectionView() {
        let collectionVC = CollectionViewController()
        collectionVC.modalPresentationStyle = .overCurrentContext
        present(collectionVC, animated: true)
    }
    
    @objc fileprivate func didTapKanyeQuote() {
        KanyeQuoteManager.shared.getKanyeQuote { (result) in
            switch result {
            case .success(let kanye):
                print(kanye.quote)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc fileprivate func didTapToast() {
        showToast(message: "Poor Internet")
    }
}

