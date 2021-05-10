//
//  PhotoView.swift
//  TandemAssignment
//
//  Created by Gagan joshi on 10/05/21.
//
import UIKit

/// <#Description#>
class PhotoView: UIView {

    @IBOutlet var photoCollectionView: UICollectionView!
    private(set) var photoCollectionViewDataServices:  PhotoCollectionViewDataServices?

    override func awakeFromNib() {
        super.awakeFromNib()
        configurePhotoView()
    }
    
    /// <#Description#>
    func configurePhotoView()  {
        photoCollectionViewDataServices = PhotoCollectionViewDataServices()
        photoCollectionView.dataSource = photoCollectionViewDataServices
        photoCollectionView.delegate = photoCollectionViewDataServices
    }
    
    /// <#Description#>
    /// - Parameter albums: <#albums description#>
    func data(photos: [PhotoViewModel])  {
        photoCollectionViewDataServices?.photos = photos
        photoCollectionView.reloadData()
    }

}
