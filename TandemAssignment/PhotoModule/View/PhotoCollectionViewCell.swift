//
//  PhotoCollectionViewCell.swift
//  TandemAssignment
//
//  Created by Gagan joshi on 10/05/21.
//

import UIKit
import SDWebImage

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var photoTitle: UILabel!
    
    @IBOutlet weak var photoThumbnailImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    /// <#Description#>
    /// - Parameter photo: <#photo description#>
    func data(photo: PhotoViewModel) {
        photoTitle.text = photo.photoTitle
        
        guard let photoThumbnail = photo.photoThumbnailURL else { return }
        photoThumbnailImageView.sd_setImage(with: URL(string: photoThumbnail), placeholderImage: .actions)
    }
}
