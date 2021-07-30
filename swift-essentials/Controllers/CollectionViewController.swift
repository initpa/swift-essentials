//
//  CollectionViewController.swift
//  swift-essentials
//
//  Created by Nitesh  on 21/05/21.
//  Copyright © 2021 nitpa.org. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {

    // MARK: - Properties
    
    private let collectionViewOne: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = UIColor.systemBackground
        collectionView.register(CollectionViewCellOne.self, forCellWithReuseIdentifier: CollectionViewCellOne.identifier)
        return collectionView
    }()
    
    private let collectionViewTwo: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = UIColor.white
        collectionView.register(CollectionViewCellTwo.self, forCellWithReuseIdentifier: CollectionViewCellTwo.identifier)
        return collectionView
    }()
    
    // MARK: - Initialition
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CollectionView"
        
        collectionViewOne.delegate = self
        collectionViewOne.dataSource = self
        collectionViewOne.isPagingEnabled = true
        
        collectionViewTwo.delegate = self
        collectionViewTwo.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationController?.navigationBar.tintColor = .label
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapDissmiss))
        
        view.addSubview(collectionViewOne)
        view.addSubview(collectionViewTwo)
        collectionViewOne.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        collectionViewTwo.anchor(top: nil, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 0, paddingLeft: 34, paddingBottom: 8, paddingRight: 34, width: 0, height: 100)
    }
    
    // MARK: - Handlers

    @objc fileprivate func didTapDissmiss() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Delegates and Datasources
extension CollectionViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case self.collectionViewOne:
            return 10
        case self.collectionViewTwo:
            return 15
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case self.collectionViewOne:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellOne.identifier, for: indexPath) as! CollectionViewCellOne
            cell.slideImageView.image = UIImage(systemName: "folder")
            cell.slideNumber.text = "\(indexPath.item)"
            return cell
        case self.collectionViewTwo:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellTwo.identifier, for: indexPath) as! CollectionViewCellTwo
            cell.slideImageView.image = UIImage(systemName: "tray")
            cell.slideNumber.text = "\(indexPath.item)"
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellOne.identifier, for: indexPath) as! CollectionViewCellOne
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case self.collectionViewOne:
            return CGSize(width: view.frame.width, height: view.frame.height)
        case self.collectionViewTwo:
            return CGSize(width: 150, height: 100)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        switch collectionView {
        case self.collectionViewOne:
            return 0
        case self.collectionViewTwo:
            return 8
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        switch collectionView {
        case self.collectionViewOne:
            collectionViewTwo.cellForItem(at: indexPath)?.layer.borderColor = UIColor.systemRed.cgColor
        case self.collectionViewTwo:
            self.collectionViewOne.scrollToItem(at: indexPath, at: .right, animated: true)
        default:
            print("default")
        }
        
//        if collectionView == collectionViewTwo {
//            self.collectionViewOne.scrollToItem(at: indexPath, at: .right, animated: true)
//        }
    }
}
