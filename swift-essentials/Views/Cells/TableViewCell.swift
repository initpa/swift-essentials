//
//  TableViewCell.swift
//  swift-essentials
//
//  Created by Nitesh  on 21/05/21.
//  Copyright © 2021 nitpa.org. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "SideMenuTableViewCell"
    
    let logoView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    let logoItem: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 0
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.layer.cornerRadius = 0
        label.textColor = .label
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(logoView)
        logoView.addSubview(logoItem)
        contentView.addSubview(nameLabel)
        
        logoView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 44, height: 0)
        logoItem.anchor(top: logoView.topAnchor, left: logoView.leftAnchor, bottom: logoView.bottomAnchor, right: logoView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
        nameLabel.anchor(top: contentView.topAnchor, left: logoItem.rightAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 8, paddingRight: 8, width: 0, height: 0)
        
    }
}
