//
//  AlbumTableViewDataServices.swift
//  TandemAssignment
//
//  Created by Gagan joshi on 10/05/21.
//

import UIKit


/// <#Description#>
final class AlbumTableViewDataServices: NSObject {
    private let cellIdentifier = "albumTableViewCell"
    
    var albums: [AlbumViewModel] = []
    var selectedAlbum: ((AlbumViewModel) -> Void)?
}


extension AlbumTableViewDataServices: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get a reference to our storyboard cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                           for: indexPath as IndexPath) as? AlbumTableViewCell else {
           return UITableViewCell()
        }
        
        cell.data(album: albums[indexPath.row])
        
        return cell
    }
}

extension AlbumTableViewDataServices: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedAlbum?(albums[indexPath.row])
        
    }
    
}
