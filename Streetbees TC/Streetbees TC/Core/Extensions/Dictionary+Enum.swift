//
//  Dictionary+Enum.swift
//  Streetbees TC
//
//  Created by Bruno Filipe Martins da Silva Miguêns on 16/08/18.
//  Copyright © 2018 Bruno Filipe Miguêns. All rights reserved.
//

import UIKit

typealias TCArray = [Any]
typealias TCDictionary = [String: Any]

extension Dictionary where Key == String {
    
    func int<T: RawRepresentable>(_ key: T) -> Int
        where T.RawValue == String {
            return int(key: key.rawValue)
    }
    
    func string<T: RawRepresentable>(_ key: T) -> String
        where T.RawValue == String {
            return string(key: key.rawValue)
    }
    
    func dictionary<T: RawRepresentable>(_ key: T) -> TCDictionary
        where T.RawValue == String {
            return dictionary(key: key.rawValue)
    }
    
    func array<T: RawRepresentable>(_ key: T) -> TCArray
        where T.RawValue == String {
            return array(key: key.rawValue)
    }
    
}
