//
//  PhotoViewController.swift
//  PhotoTaps
//
//  Created by Danis on 10.02.2021.
//

import UIKit

class PhotoViewController: UIViewController {
    var image:UIImage?
    @IBOutlet weak var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.image = image
    }
    

    @IBAction func shareAction(_ sender: Any) {
        let shareController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        present(shareController, animated: true, completion: nil)
         
    }
   
    

}
