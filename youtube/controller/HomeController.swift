//
//  ViewController.swift
//  youtube
//
//  Created by Tu (Callie) T. NGUYEN on 6/24/19.
//  Copyright © 2019 Tu (Callie) T. NGUYEN. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
//    var videos: [Video] = {
//        var taylorChannel = Channel()
//        taylorChannel.name = "Taylor Swift VEVO"
//        taylorChannel.profileImageName =  "taylor-swift-profile"
//
//        var blankSpaceVideo = Video()
//        blankSpaceVideo.title = "Taylor Swift - Blank Space"
//        blankSpaceVideo.thumbnailImageName = "blankspace"
//        blankSpaceVideo.channel = taylorChannel
//        blankSpaceVideo.numberOfViews = 1282459829732
//
//        var badBloodVideo = Video()
//        badBloodVideo.title = "Taylor Swift - bad Blood featuring Kendrick Lama"
//        badBloodVideo.thumbnailImageName = "badblood"
//        badBloodVideo.channel = taylorChannel
//        badBloodVideo.numberOfViews = 373648992
//
//        return [blankSpaceVideo, badBloodVideo]
//    }()
    
    var videos : [Video]?
    
    func fetchVideos() {
        let url = NSURL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        let request = URLRequest(url: url! as URL )
    
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print(error as Any)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                self.videos = [Video]()
                for dictionary in json as! [[String: Any]] {
                    let video = Video()
                    video.title = dictionary["title"] as? String
                    video.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
                    self.videos?.append(video)
                }
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            } catch let jsonError {
                print(jsonError)
            }
            
        }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchVideos()
        
        setupMenuBar()
        setupTitle()
        setupCollectionView()
        registerCell()
        setupNavBarButtons()
    }
    
    func setupTitle() {
        
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
    }
    
    func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    }
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]|", views: menuBar)
        
    }
    
    func registerCell() {
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "CellID") 
    }
    
    func setupNavBarButtons() {
        
        let searchImage = UIImage(named: "search-icon")?.withRenderingMode(.alwaysTemplate)
        let moreImage = UIImage(named: "show-more-button")?.withRenderingMode(.alwaysTemplate)
        
        
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        searchBarButtonItem.tintColor = .white
        
        let moreButton = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(handleSearch))
        moreButton.tintColor = .white
        
        navigationItem.rightBarButtonItems = [moreButton, searchBarButtonItem]
    }
    
    @objc func handleSearch() {
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return videos?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath) as! VideoCell
        
        cell.video = videos?[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 16 + 88)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}
