//
//  ComicCollectionViewCell.swift
//  Streetbees TC
//
//  Created by Bruno Filipe Martins da Silva Miguêns on 24/08/18.
//  Copyright © 2018 Bruno Filipe Miguêns. All rights reserved.
//

import UIKit
import SDWebImage

class ComicCollectionViewCell: UICollectionViewCell {
    
    static let id: String = "ComicCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    
    var comic: Comic? {
        didSet {
            updateLayout()
        }
    }

}

extension ComicCollectionViewCell {
    
    func updateLayout() {
        guard let object = comic else { return }
        
       imageView.sd_setImage(with: object.thumbnail.url)
       imageView.contentMode = object.thumbnail.contentMode
    }
    
}
