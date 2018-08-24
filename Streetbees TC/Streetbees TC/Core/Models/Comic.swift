//
//  Comic.swift
//  Streetbees TC
//
//  Created by Bruno Filipe Martins da Silva Miguêns on 24/08/18.
//  Copyright © 2018 Bruno Filipe Miguêns. All rights reserved.
//

import Foundation

struct Comic {
    
    let id: Int
    let title: String
    let issueNumber: Int
    let description: String
    let isbn: String
    let pageCount: Int
    let thumbnail: Image
    let images: [Image]
    
    init(dictionary: TCDictionary) {
        id = dictionary.int(MarvelKey.Api.id)
        issueNumber = dictionary.int(MarvelKey.Api.issueNumber)
        pageCount = dictionary.int(MarvelKey.Api.pageCount)
        title = dictionary.string(MarvelKey.Api.title)
        description = dictionary.string(MarvelKey.Api.description)
        isbn = dictionary.string(MarvelKey.Api.isbn)
        
        thumbnail = Image(dictionary: dictionary.dictionary(MarvelKey.Api.thumbnail))
        
        guard let imagesArray = dictionary.array(MarvelKey.Api.images) as? [TCDictionary],
             imagesArray.count > 0 else {
            images = []
            return
        }
        images = imagesArray.map({ Image(dictionary: $0) })
    }
    
}
