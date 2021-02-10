//
//  PhotosCollectionViewController.swift
//  PhotoTaps
//
//  Created by Danis on 10.02.2021.
//

import UIKit

 

class PhotosCollectionViewController: UICollectionViewController {
    
    let photos = ["1","2","3","4","5","6","7","8","9","10"]
    
    let itemPerRow:CGFloat = 2
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right:20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        navigationItem.title = "Просмотр Фото"
    }

 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pickPhoto" {
            let photoVC = segue.destination as! PhotoViewController
            let cell = sender as! PhotoCell
            
            photoVC.image  = cell.docImageView.image
            
        }
    }
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        let imageName = photos[indexPath.row]
        let image = UIImage(named: imageName)
        
        cell.docImageView.image = image
     
        return cell
    }


}


extension PhotosCollectionViewController:UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidth = sectionInserts.left * (itemPerRow + 1)
        let avaibaleWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = avaibaleWidth / itemPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.right
    }
 
}
