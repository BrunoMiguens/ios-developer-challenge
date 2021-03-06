//
//  Dictionary+Parser.swift
//  Streetbees TC
//
//  Created by Bruno Filipe Martins da Silva Miguêns on 16/08/18.
//  Copyright © 2018 Bruno Filipe Miguêns. All rights reserved.
//

import Foundation

extension Dictionary where Key == String {
    
    func int(key: String) -> Int {
        var output: Int = 0
        if let value = self[key] as? Int {
            output = value
        } else if let number = self[key] as? NSNumber {
            output = number.intValue
        }
        return output
    }
    
    func string(key: String) -> String {
        var output: String = ""
        if let number = self[key] as? NSNumber {
            output = number.stringValue
        } else if let value = self[key] as? String {
            output = value
        }
        return output
    }
    
    func dictionary(key: String) -> TCDictionary {
        var output: TCDictionary = [:]
        if let value = self[key] as? TCDictionary {
            output = value
        }
        return output
    }
    
    func array(key: String) -> TCArray {
        var output: TCArray = []
        if let value = self[key] as? TCArray {
            output = value
        }
        return output
    }
    
}
