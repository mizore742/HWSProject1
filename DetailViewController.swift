//
//  DetailViewController.swift
//  Project1
//
//  Created by Hoang Nguyen on 7/12/17.
//  Copyright © 2017 Hoang Nguyen. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?
    var pics = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage
        {
            imageView.image = UIImage(named: imageToLoad)
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    func shareTapped() {
        
        //Airdrop
       /* let vc = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true) */
        
        //Facebook
        /* if let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook) {
            vc.setInitialText("Look at this great picture!")
            vc.add(imageView.image!)
            vc.add(URL(string: "http://www.photolib.noaa.gov/nssl"))
            present(vc, animated: true)
        } */
        
        //Twitter
        if let vc = SLComposeViewController(forServiceType: SLServiceTypeTwitter) {
            vc.setInitialText("Look at this great picture!")
            vc.add(imageView.image!)
            vc.add(URL(string: "http://www.photolib.noaa.gov/nssl"))
            present(vc, animated: true)
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    



}
