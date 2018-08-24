//
//  MarvelAuth.swift
//  Streetbees TC
//
//  Created by Bruno Filipe Martins da Silva Miguêns on 24/08/18.
//  Copyright © 2018 Bruno Filipe Miguêns. All rights reserved.
//

import UIKit

class MarvelAuth {
    
    fileprivate let fileName: String = "marvel_keys"
    fileprivate let fileType: String = "plist"
    
    fileprivate var cache: [String: Any] = [:]
    
    static let shared = MarvelAuth()
    
    init() {
        load()
    }
    
}

extension MarvelAuth {
    
    fileprivate var privateKey: String {
        return cache.string(MarvelKey.Local.privateKey)
    }
    
    var publicKey: String {
        return cache.string(MarvelKey.Local.publicKey)
    }
    
    var authParameters: [String: Any] {
        let timestamp = Date().timeIntervalSince1970.description
        let hash = (timestamp + privateKey + publicKey).utf8.md5
        return ["apikey": publicKey, "ts": timestamp, "hash": hash]
    }
    
}

extension MarvelAuth {
    
    fileprivate func load() {
        guard let path = Bundle.main.path(forResource: fileName, ofType: fileType),
            let info = NSDictionary(contentsOfFile: path) else { return }
        
        guard let dicitonary = info as? [String: Any] else { return }
        
        cache = dicitonary
    }
    
}
