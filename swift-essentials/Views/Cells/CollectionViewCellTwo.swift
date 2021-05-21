//
//  CollectionViewCellTwo.swift
//  swift-essentials
//
//  Created by Nitesh  on 21/05/21.
//  Copyright © 2021 nitpa.org. All rights reserved.
//

import UIKit

class CollectionViewCellTwo: UICollectionViewCell {
    
    static let identifier = "CollectionViewCellTwo"
    
    let slideNumber: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.cyan
        label.textAlignment = .center
        return label
    }()
    
    let slideImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .systemBackground
        imageView.contentMode = .scaleToFill
        imageView.isUserInteractionEnabled = true
        imageView.clipsToBounds = true
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
        slideNumber.anchor(top: contentView.topAnchor, left: nil, bottom: nil, right: contentView.rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 22, height: 22)
        slideImageView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 0, height: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
