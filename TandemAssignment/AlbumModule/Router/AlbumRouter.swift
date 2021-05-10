//
//  AlbumRouter.swift
//  TandemAssignment
//
//  Created by Gagan joshi on 10/05/21.
//

import UIKit

/// <#Description#>
protocol AlbumViewRoutingLogic {
    
    /// <#Description#>
    /// - Parameters:
    ///   - source: <#source description#>
    ///   - data: <#data description#>
    func presentToViewImageController(source: AlbumViewController, data: AlbumViewModel)
}

class AlbumRouter: AlbumViewRoutingLogic {
        
    /// <#Description#>
    /// - Parameters:
    ///   - source: <#source description#>
    ///   - data: <#data description#>
    func presentToViewImageController(source: AlbumViewController, data: AlbumViewModel) {
        guard let viewController = PhotoRouter.photoViewController() else { return }
        viewController.router?.dataStore = data as? AlbumModel
        source.navigationController?.pushViewController(viewController, animated: true)
    }
}
