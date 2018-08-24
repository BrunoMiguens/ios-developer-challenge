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
    let image: Image
    
    init(dictionary: TCDictionary) {
        id = dictionary.int(MarvelKey.Api.id)
        issueNumber = dictionary.int(MarvelKey.Api.issueNumber)
        pageCount = dictionary.int(MarvelKey.Api.pageCount)
        title = dictionary.string(MarvelKey.Api.title)
        description = dictionary.string(MarvelKey.Api.description)
        isbn = dictionary.string(MarvelKey.Api.isbn)
        
        image = Image(dictionary: dictionary.dictionary(MarvelKey.Api.images))
        thumbnail = Image(dictionary: dictionary.dictionary(MarvelKey.Api.thumbnail))
    }
    
}
