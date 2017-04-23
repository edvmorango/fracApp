//
//  Beer.swift
//  fracApp
//
//  Created by José Eduardo Vieira Morango on 23/04/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import Foundation
import ObjectMapper

struct Beer: Mappable{
    
    var id : Int!
    var name: String!
    var description: String!
    var tagline: String!
    var url: String!
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        tagline <- map["tagline"]
        url <- map["url"]
        
    }


}
