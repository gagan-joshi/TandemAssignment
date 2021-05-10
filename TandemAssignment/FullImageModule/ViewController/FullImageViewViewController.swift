//
//  ViewImageViewControllerViewController.swift
//  TandemAssignment
//
//  Created by Gagan joshi on 10/05/21.
//
import UIKit

/// `FullImageViewViewControllerOutput <I>`  will contain the behavior of display data.
protocol FullImageViewViewControllerOutput: AnyObject {
    
    
  //  FullImageViewViewController
  //  AlbumViewControllerOutput
    /// Display full photo into view.
    /// - Parameter viewModel: Type should be **FullImagePhotoViewModel**
    func displayPhotos(viewModel: FullImagePhotoViewModel)
}

/// `FullImageViewViewController` will contains the elements & action.
class FullImageViewViewController: UIViewController {
    
    /// Variables
    var presenter: FullImageViewPresentationInput?
    var router: (FullImageViewRoutingLogic & FullImageViewDataPassing)?
    
    /// Outlet
    @IBOutlet var imageView: UIImageView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    private func setup() {
        let viewController = self
        let presenter = FullImageViewPresenter()
        let router = FullImageViewRouter()
        presenter.viewController = viewController
        viewController.presenter = presenter
        viewController.router = router
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    /// Configure view as a default.
    private func configureView() {
        /// Set color
        let customColor = UIColor(red: 44/255, green: 44/255, blue: 46/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = customColor

        /// Set navigation bar button
        let barItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(action))
        barItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        self.navigationItem.rightBarButtonItem = barItem
        
        /// Get data/
        presenter?.present(photo: router?.dataStore)
    }
    
    @objc func action(sender: UIBarButtonItem) {
        // Function body goes here
        self.dismiss(animated: true, completion: nil)
    }
}

extension FullImageViewViewController: FullImageViewViewControllerOutput {
    
    /// Display full photo into view.
    /// - Parameter viewModel: Type should be **FullImagePhotoViewModel**
    func displayPhotos(viewModel: FullImagePhotoViewModel) {
        // Use the outlet in our custom class to get a references of elemnets.
        if let photoURL = viewModel.fullImagePhotoUrl {
            imageView.sd_setImage(with: URL(string: photoURL), placeholderImage: .actions)
        }
    }
}
