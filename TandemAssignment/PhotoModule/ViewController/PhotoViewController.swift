//
//  PhotoViewController.swift
//  TandemAssignment
//
//  Created by Gagan joshi on 10/05/21.
//

import UIKit


/// <#Description#>
protocol PhotoViewControllerOutput: AnyObject {
   
    /// <#Description#>
    /// - Parameter viewModel: <#viewModel description#>
    func displayPhotos(viewModel: [PhotoViewModel])
}

/// <#Description#>
class PhotoViewController: UIViewController {

    var photoInteractorInput : PhotoInteractorInput?
    var router: (PhotoViewRoutingLogic & PhotoViewDataPassing)?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        router = PhotoRouter()
        // Do any additional setup after loading the view.
        
        photoInteractorInput = PhotoInteractor(presenter: PhotoPresenter(photoViewController: self))
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoInteractorInput?.fetchPhotos(album: router?.dataStore)
        self.title = router?.dataStore?.albumTitle
    }
}

extension PhotoViewController : PhotoViewControllerOutput {
    func displayPhotos(viewModel: [PhotoViewModel]) {
        (view as? PhotoView)?.data(photos: viewModel)
        (view as? PhotoView)?.photoCollectionViewDataServices?.selectedPhoto = { [weak self] photo in
            guard let self = self else { return }
            self.router?.presentToViewImageController(source: self, data: photo)
        }
    }
    
    
}
