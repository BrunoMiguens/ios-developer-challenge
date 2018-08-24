//
//  MarvelService+Target.swift
//  Streetbees TC
//
//  Created by Bruno Filipe Martins da Silva Miguêns on 24/08/18.
//  Copyright © 2018 Bruno Filipe Miguêns. All rights reserved.
//

import Moya

extension MarvelService: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://gateway.marvel.com")!
    }
    
    var path: String {
        switch self {
            
        case .comics:
            return "/v1/public/comics"
            
        }
    }
    
    var method: Method {
        switch self {
            
        case .comics:
            return .get
            
        }
    }
    
    var task: Task {
        switch self {
            
        case .comics:
            return .requestParameters(parameters: MarvelAuth.shared.authParameters, encoding: URLEncoding.default)
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
    
    
}
