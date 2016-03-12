//
//  UploadViewController.swift
//  API
//
//  Created by Lukasz Mroz on 12.03.2016.
//  Copyright © 2016 DroidsOnRoids. All rights reserved.
//

import UIKit

class UploadViewController: UIViewController {

    enum UIState {
        
        case Default
        case Uploading
        
    }
    
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var uploadCatButton: UIButton!
    var state: UIState = .Default {
        didSet {
            switch state {
            case .Default:
                uploadCatButton.enabled = true
                spinner.stopAnimating()
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            case .Uploading:
                uploadCatButton.enabled = false
                spinner.startAnimating()
                UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func uploadCat(sender: AnyObject) {
        state = .Uploading
        SnapchatAPI.upload(image: imageView.image!) { [unowned self] in
           self.state = .Default
        }
    }
    
}
