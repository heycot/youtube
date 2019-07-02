//
//  VideoCell.swift
//  youtube
//
//  Created by Tu (Callie) T. NGUYEN on 7/2/19.
//  Copyright © 2019 Tu (Callie) T. NGUYEN. All rights reserved.
//

import UIKit

class VideoCell : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "blankspace")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let separatorView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()
    
    let userProfileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "taylor-swift-profile")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Taylor Swift - Blank Space"
        return label
    }()
    
    let subTitleTextView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "TaylorSwiftVEVO - 1,604.684.607 views * 2 years ago"
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        textView.textColor = .lightGray
        return textView
    }()
    
    func setupViews() {
        
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subTitleTextView)
        
        
        addConstraintsWithFormat(format:  "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWithFormat(format:  "H:|-16-[v0(44)]|", views: userProfileImageView)
        addConstraintsWithFormat(format:  "H:|[v0]|", views: separatorView)
        
        // vertical constraints
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, userProfileImageView, separatorView)
        
        // top constaint
        addConstraints([NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8)])
        //left constraint
        addConstraints([NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8)])
        //left constraint
        addConstraints([NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0)])
        //left constraint
        addConstraints([NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20)])
        
        // top constaint
        addConstraints([NSLayoutConstraint(item: subTitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4)])
        //left constraint
        addConstraints([NSLayoutConstraint(item: subTitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8)])
        //left constraint
        addConstraints([NSLayoutConstraint(item: subTitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0)])
        //left constraint
        addConstraints([NSLayoutConstraint(item: subTitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30)])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("error iniy video cell")
    }
}

