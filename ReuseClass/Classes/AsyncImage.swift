//
//  AsyncImage.swift
//  ReuseClass
//
//  Created by MacV on 27/01/21.
//

import Foundation
var asyncImagesArray = NSCache<NSString, UIImage>()

class AsyncImage: UIImageView {
    
    private var currentURL: NSString?
    func loadAsyncImage(url: String, placeholder: UIImage?) {
        let imageURL = url as NSString
        if let cashedImage = asyncImagesArray.object(forKey: imageURL) {
            image = cashedImage
            return
        }
        image = placeholder
        currentURL = imageURL
        guard let requestURL = URL(string: url) else { image = placeholder; return }
        URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
            DispatchQueue.main.async { [weak self] in
                if error == nil {
                    if let imageData = data {
                        if self?.currentURL == imageURL {
                            if let imageToPresent = UIImage(data: imageData) {
                                asyncImagesArray.setObject(imageToPresent, forKey: imageURL)
                                self?.image = imageToPresent
                            } else {
                                self?.image = placeholder
                            }
                        }
                    } else {
                        self?.image = placeholder
                    }
                } else {
                    self?.image = placeholder
                }
            }
        }.resume()
    }
}

