//
//  ViewController.swift
//  API
//
//  Created by Lukasz Mroz on 12.03.2016.
//  Copyright © 2016 Droids On Roids. All rights reserved.
//

import UIKit

class DownloadViewController: UIViewController {

    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SnapchatAPI.getImages { [weak self] result in
            // If we get an array of image data
            guard case .Success(let response) = result else { return }
            print(response)
            // Now make sure the response is an array of dicts
            guard let imageArray = response["images"] as? [[String: AnyObject]] else { return }
            
            // Now iterate over the array of dicts
            for imageDict in imageArray {
                // Get imageURL for current dict
                if let imageURL = imageDict["url"] as? String {
                    // Download image with given URL
                    SnapchatAPI.downloadImage(imageURL) { [weak self] result in
                        if case .Success(let image) = result {
                            self?.images.append(image)
                        }
                    }
                }
            }
        }
    }

}

