//
//  PhotoCollectionViewDataServices.swift
//  TandemAssignment
//
//  Created by Gagan joshi on 10/05/21.
//



import UIKit

/// <#Description#>
final class PhotoCollectionViewDataServices: NSObject {
    
    private let cellIdentifier = "photoCollectionViewCell"
    
    var photos: [PhotoViewModel] = []
    var selectedPhoto: ((PhotoViewModel) -> Void)?
}

extension PhotoCollectionViewDataServices: UICollectionViewDataSource {
    
    // Tell the collection view how many cells to make.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    // Make a cell for each cell index path.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Get a reference to our storyboard cell
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
                                                           for: indexPath as IndexPath) as? PhotoCollectionViewCell else {
           return UICollectionViewCell()
        }
        
        cell.data(photo: photos[indexPath.item])
        return cell
    }
}



extension PhotoCollectionViewDataServices: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPhoto?(photos[indexPath.item])
    }
}


extension PhotoCollectionViewDataServices: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                           layout collectionViewLayout: UICollectionViewLayout,
                           sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: width/2.1, height: width/2.1 + 40)
    }
}
