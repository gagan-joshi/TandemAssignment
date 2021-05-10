//
//  AlbumViewController.swift
//  TandemAssignment
//
//  Created by Gagan joshi on 10/05/21.
//

import UIKit

/// `AlbumViewControllerOutput <I>`  will contain the behavior of display data.
protocol AlbumViewControllerOutput: AnyObject {
   
    /// Display albums into view.
    /// - Parameter viewModel: Type should be **[AlbumViewModel]**
    func displayAlbums(viewModel: [AlbumViewModel])
}

/// <#Description#>
class AlbumViewController: UIViewController {

    var albumInteractorInput: AlbumInteractorInput?
    var router: AlbumViewRoutingLogic?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    /// <#Description#>
    private func setup() {
        router = AlbumRouter()
        albumInteractorInput = AlbumInteractor(presenter: AlbumPresenter(albumViewController: self))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Albums"
        albumInteractorInput?.fetchAlbums()
    }

}

extension AlbumViewController: AlbumViewControllerOutput {
   
    func displayAlbums(viewModel: [AlbumViewModel]) {
        (view as? AlbumView)?.data(albums: viewModel)
        (view as? AlbumView)?.albumTableViewDataServices?.selectedAlbum = { [weak self] album in
            guard let self = self else { return }
            self.router?.presentToViewImageController(source: self, data: album)
        }
    }
    
}

