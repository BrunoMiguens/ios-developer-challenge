//
//  Image.swift
//  Streetbees TC
//
//  Created by Bruno Filipe Martins da Silva Miguêns on 24/08/18.
//  Copyright © 2018 Bruno Filipe Miguêns. All rights reserved.
//

import UIKit

struct Image {
    
    let path: String
    let fileExtension: String
    
    init(dictionary: TCDictionary) {
        path = dictionary.string(MarvelKey.Api.imagePath)
        fileExtension = dictionary.string(MarvelKey.Api.fileExtension)
    }
    
}

extension Image {
    
    var url: URL? {
        return URL(string: "\(path).\(fileExtension)")
    }
    
    var contentMode: UIViewContentMode {
        guard let link = url else { return .scaleToFill }
        guard !link.absoluteString.contains("image_not_available") else { return .scaleToFill }
        return .scaleAspectFill
    }
    
}
