//
//  MarvelKey.swift
//  Streetbees TC
//
//  Created by Bruno Filipe Martins da Silva Miguêns on 24/08/18.
//  Copyright © 2018 Bruno Filipe Miguêns. All rights reserved.
//

import UIKit

enum MarvelKey { }

extension MarvelKey {
    
    enum Local: String {
        case publicKey
        case privateKey
    }
    
    enum Api: String {
        
        case data
        case results
        
        case id
        case title
        case issueNumber
        case description
        case isbn
        case pageCount
        case thumbnail
        case images
        case prices
        
        case imagePath = "path"
        case fileExtension = "extension"
    }
    
}
