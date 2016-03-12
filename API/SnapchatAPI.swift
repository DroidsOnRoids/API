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
internal struct SnapchatAPIConstants {
    
    struct URL {
        static let base = "http://onet.pl"
        static let uploadImage = {
            return base + "/uploadImage"
        }()
        static func uploadImage(toUser userId: Int) -> String {
            return base + "/uploadImage/\(userId)"
        }
        static let getImages = {
           return base + "/images"
        }()
        static func getImages(forUser userId: Int) -> String {
            return base + "/images/\(userId)"
        }
    }
    
}

/// Main struct to SnapchatAPI with uploading/downloading
struct SnapchatAPI {
    
    /// Uploads image and will be send to everyone
    static func upload(image image: UIImage, completion: () -> ()) {
        // We transform our image to data that we can send on server.
        // Here we have 80% compression quality, which is 0.8 by default,
        // you can change it by specifying parameter in toData() function.
        // We use guard to be sure that our image can be represented as
        // NSData.
        guard let imageData = image.toData() else { return }
        
        // Using Alamofire we will upload the data on a server and return
        // response with completion block
        Alamofire.upload(.POST,
            SnapchatAPIConstants.URL.uploadImage,
            data: imageData).responseJSON() { response -> Void in
                completion()
        }
    }
    
    /// Uploads image, but only to specific user
    static func upload(image image: UIImage, toUser userId: Int, completion: () -> ()) {
        
    }
    
    /// Fetch images that were sent to everyone
    static func getImages(completion: () -> ()) {
        
    }
    
    /// Fetch images that were sent to you OR to everyone
    static func getImages(forUser: Int, completion: () -> ()) {
        
    }
    
}

extension UIImage {
    func toData(withCompressQuality compressQuality: CGFloat = 0.8) -> NSData? {
        return UIImageJPEGRepresentation(self, compressQuality)
    }
}
