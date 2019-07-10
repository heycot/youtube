//
//  Extention.swift
//  youtube
//
//  Created by Tu (Callie) T. NGUYEN on 7/2/19.
//  Copyright © 2019 Tu (Callie) T. NGUYEN. All rights reserved.
//

import UIKit


extension UIColor {
    static func rbg(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}


extension UIView {
    func addConstraintsWithFormat(format: String , views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

let imageCache = NSCache<AnyObject, AnyObject>()

class CustomUIImageView : UIImageView {
    
    var imageUrlString: String?
    
    func loadImageUsingUrlString(urlString: String) {
        
        imageUrlString = urlString
        
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        
        image = nil
        
        if let imageFromCatche = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCatche
            return
        } else {
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if error != nil {
                    print(error as Any)
                    return
                }
                
                DispatchQueue.main.async {
                    let imageToCache = UIImage(data: data!)
                    
                    if self.imageUrlString == urlString {
                        self.image = UIImage(data: data!)
                    }
                    
                    imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
                    
                }
            }.resume()
        }
        
    }
}

