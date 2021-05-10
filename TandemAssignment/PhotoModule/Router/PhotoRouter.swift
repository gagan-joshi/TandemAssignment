//
//  PhotoRouter.swift
//  TandemAssignment
//
//  Created by Gagan joshi on 10/05/21.
//

import UIKit

protocol PhotoViewRoutingLogic {

    static func photoViewController() -> PhotoViewController?

    func presentToViewImageController(source: PhotoViewController, data: PhotoViewModel)


}

protocol PhotoViewDataPassing {
    var dataStore: AlbumModel? { get set }
}

class PhotoRouter: PhotoViewRoutingLogic, PhotoViewDataPassing  {

    var dataStore: AlbumModel?

   
    static func photoViewController() -> PhotoViewController? {
        let storyboard = UIStoryboard(name: "Photo", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(identifier: "photoViewController") as? PhotoViewController else {
            return nil
        }
        
        return viewController
    }
    
    
    
    func presentToViewImageController(source: PhotoViewController, data: PhotoViewModel) {
      
        guard let viewController = FullImageViewRouter.fullImageViewViewController() else { return }
        viewController.router?.dataStore = data as? PhotoModel
        
        let navigationController = UINavigationController(rootViewController: viewController)
        source.present(navigationController, animated: true, completion: nil)
  
    }
}
