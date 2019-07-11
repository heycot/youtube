//
//  SettingCell.swift
//  youtube
//
//  Created by Tu (Callie) T. NGUYEN on 7/11/19.
//  Copyright © 2019 Tu (Callie) T. NGUYEN. All rights reserved.
//

import UIKit

class Setting: NSObject {
    
    let name: String
    let imageName: String
    
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}

class SettingCell: BaseCell {
    
    var setting : Setting? {
        didSet {
            nameLabel.text = setting?.name
            
            if let imageName = setting?.imageName {
                iconImageView.image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
                iconImageView.tintColor = .red
            }
        }
    }
    
    let nameLabel: UILabel = {
        let lable = UILabel()
        lable.text = "Setting"
        lable.font = UIFont.systemFont(ofSize: 13)
        return lable
    }()
    
    let iconImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fire")?.withRenderingMode(.alwaysTemplate)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? .darkGray : .white
            
            nameLabel.textColor = isHighlighted ? .white : .black
            
            iconImageView.tintColor = isHighlighted ? .white : .darkGray
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(nameLabel)
        addSubview(iconImageView)
        
        addConstraintsWithFormat(format: "H:|-8-[v0(25)]-8-[v1]|", views: iconImageView, nameLabel)
        addConstraintsWithFormat(format: "V:|[v0]|", views: nameLabel)
        addConstraintsWithFormat(format: "V:|-10-[v0(25)]|", views: iconImageView)
        
        
        addConstraint(NSLayoutConstraint(item: iconImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}
