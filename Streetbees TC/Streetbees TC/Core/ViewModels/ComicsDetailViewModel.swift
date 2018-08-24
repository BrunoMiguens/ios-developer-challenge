//
//  ComicsDetailViewModel.swift
//  Streetbees TC
//
//  Created by Bruno Filipe Martins da Silva Miguêns on 24/08/18.
//  Copyright © 2018 Bruno Filipe Miguêns. All rights reserved.
//

import UIKit

class ComicsDetailViewModel {
    
    
}

extension ComicsDetailViewModel {
    
    func update(imageView: UIImageView, with comic: Comic?) {
        guard let object = comic else { return }
        
        imageView.sd_setImage(with: object.thumbnail.url)
    }
    
    func dismiss(from controller: UIViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}
