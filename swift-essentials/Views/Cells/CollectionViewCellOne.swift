//
//  CollectionViewCellOne.swift
//  swift-essentials
//
//  Created by Nitesh  on 21/05/21.
//  Copyright © 2021 nitpa.org. All rights reserved.
//

import UIKit

class CollectionViewCellOne: UICollectionViewCell {
    
    static let identifier = "CollectionViewCellOne"
    
    let slideNumber: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .systemBackground
        label.tintColor = .label
        return label
    }()
    
    let slideImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .systemBackground
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.clipsToBounds = true
        imageView.tintColor = .label
        return imageView
    }()
            
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.backgroundColor = .clear
        contentView.addSubview(slideImageView)
        contentView.addSubview(slideNumber)
        slideImageView.frame = contentView.bounds
        slideNumber.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 44, height: 44)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
