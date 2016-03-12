//
//  SnapchatAPI.swift
//  API
//
//  Created by Lukasz Mroz on 12.03.2016.
//  Copyright © 2016 DroidsOnRoids. All rights reserved.
//

import Alamofire

/// Struct containing all constants that are needed for 
/// API Requests, like URLS, parameter names etc.
struct SnapchatAPIConstants {
    
    static let baseURL = ""
    static let uploadImageToAllURL = {
        return ""
    }()
    
}

/// Main struct to SnapchatAPI with uploading/downloading
struct SnapchatAPI {
    
    /// Uploads image and will be send to everyone
    func upload(image image: UIImage, completion: () -> ()) {
        // We transform our image to data that we can send on server.
        // Here we have 80% compression quality, which is 0.8
        if let imageData = UIImageJPEGRepresentation(image, 0.8) {
            // Using Alamofire we will upload the data on a server and return
            // response with completion block
            Alamofire.upload(.POST,
                SnapchatAPIConstants.uploadImageToAllURL,
                data: imageData).responseJSON() { response -> Void in
                    completion()
            }
        }
    }
    
    /// Uploads image, but only to specific user
    func upload(image image: UIImage, toUser userId: Int, completion: () -> ()) {
        
    }
    
    /// Fetch images that were sent to everyone
    func getImages(completion: () -> ()) {
        
    }
    
    /// Fetch images that were sent to you OR to everyone
    func getImages(forUser: Int, completion: () -> ()) {
        
    }
    
}
