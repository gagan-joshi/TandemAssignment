//
//  ViewImageRouter.swift
//  TandemAssignment
//
//  Created by Gagan joshi on 10/05/21.
//

import UIKit

/// `FullImageViewRoutingLogic <I>` will contain the behavior of routing.
protocol FullImageViewRoutingLogic {
    
    /// Get Full image view controller.
    /// - Returns: Type can be **FullImageViewViewController** or **Nil**
    static func fullImageViewViewController() -> FullImageViewViewController?
}

protocol FullImageViewDataPassing {
    var dataStore: PhotoModel? { get set }
}

/// `FullImageViewRouter` will contain the `FullImageViewRoutingLogic <I>`  methods implementations.
class FullImageViewRouter: NSObject, FullImageViewRoutingLogic, FullImageViewDataPassing {
    
    var dataStore: PhotoModel?
    
    /// Get Full image view controller.
    /// - Returns: Type can be **FullImageViewViewController** or **Nil**
    class func fullImageViewViewController() -> FullImageViewViewController? {
        let storyboard = UIStoryboard(name: "FullImageStoryboard", bundle: Bundle.main)
        guard let viewController = storyboard.instantiateViewController(identifier: "fullImageViewViewController") as? FullImageViewViewController else {
            return nil
        }
        
        return viewController
    }
    
}
