//
//  DetailViewController.swift
//  Project1
//
//  Created by Shah, Shubham on 17/02/20.
//  Copyright © 2020 Shubham shah. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var positionOfSelectedImage: Int = 0
    var numberOfImages: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Picture \(positionOfSelectedImage) of \(numberOfImages)"
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        
        guard let selectedImage  = selectedImage else { return }
        let items: [Any] = ["\(selectedImage)",image]

        
        let vc = UIActivityViewController(activityItems: items, applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc,animated: true)
    }
}
