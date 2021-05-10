//
//  AlbumView.swift
//  TandemAssignment
//
//  Created by Gagan joshi on 10/05/21.
//

import UIKit

class AlbumView: UIView {

    @IBOutlet var albumTableView: UITableView!
    private(set) var albumTableViewDataServices:  AlbumTableViewDataServices?

    override func awakeFromNib() {
        super.awakeFromNib()
        configureAlbumView()
    }
    
    /// <#Description#>
    func configureAlbumView()  {
        albumTableViewDataServices = AlbumTableViewDataServices()
        albumTableView.dataSource = albumTableViewDataServices
        albumTableView.delegate = albumTableViewDataServices
    }
    
    /// <#Description#>
    /// - Parameter albums: <#albums description#>
    func data(albums: [AlbumViewModel])  {
        albumTableViewDataServices?.albums = albums
        albumTableView.reloadData()
    }

}
