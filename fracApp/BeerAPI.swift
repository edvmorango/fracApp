//
//  BeerAPI.swift
//  fracApp
//
//  Created by José Eduardo Vieira Morango on 23/04/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import Foundation
import Moya
import Alamofire


enum BeerAPI{
    case allBeers
    case beer(id: Int)
    case filteredBeers(name: String?)
    
}


extension BeerAPI: TargetType{

    var baseURL : URL{ return URL(string: "https://api.punkapi.com/v2/")! }
    public var path: String{
        switch self{
        case .allBeers : return "beers"
        case .beer(let id) : return "beers/\(id)"
        case .filteredBeers : return "beers"
        }
    }
    
    var method: Moya.Method{
        switch self { case .allBeers, .filteredBeers, .beer : return .get }
    }
    
    public var parameterEncoding: Moya.ParameterEncoding{ return URLEncoding.default}
    public var parameters: [String : Any]?{
        switch self {
        case .allBeers : return nil
        case .beer : return nil
        case .filteredBeers(let name) :
            guard let uName = name else{ return nil }
            return ["beer_name" : uName.replacingOccurrences(of: " ", with: "_") ]
        }
    }

    public var task: Task{ return .request }
    public var sampleData : Data{
        switch self{ default: return Data()}
    }
}
