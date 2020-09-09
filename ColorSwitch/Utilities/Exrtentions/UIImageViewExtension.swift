//
//  UIImageViewExtension.swift
//  Loyalty
//
//  Created by Ihor Kramarets on 27.07.2020.
//  Copyright © 2020 Ihor Kramarets. All rights reserved.
//

import UIKit


let imageCache = NSCache<NSString, AnyObject>()
extension UIImageView {
    func loadImagesUsingCacheWithUrlString(urlString: String) {
        
        self.image = nil
        
        //check cache for image first
        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = cachedImage
            return
        }
        //otherwise fire off a new download
        guard let firebaseImageUrl:URL = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: firebaseImageUrl) { (data, _, error) in
            if error != nil {
                return
            }
            if data != nil {
                DispatchQueue.main.async {
                    if let downloadedImage = UIImage(data: data!) {
                        imageCache.setObject(downloadedImage, forKey: urlString as NSString)
                        self.image = UIImage(data: data!)
                    }
                }
                
            }
        }.resume()
    }
}
