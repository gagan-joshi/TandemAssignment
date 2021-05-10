//
//  AlbumTableViewCell.swift
//  TandemAssignment
//
//  Created by Gagan joshi on 10/05/21.
//

import UIKit

/// <#Description#>
class AlbumTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        detailTextLabel?.numberOfLines = 0
    }
    
    /// <#Description#>
    /// - Parameter album: <#album description#>
    func data(album: AlbumViewModel)  {
        textLabel?.text = album.albumTitle
        detailTextLabel?.text = album.albumDiscription
    }

}
