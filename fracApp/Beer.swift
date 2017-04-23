//
//  Beer.swift
//  fracApp
//
//  Created by José Eduardo Vieira Morango on 23/04/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import Foundation
import Gloss

struct Beer: Decodable{
    
    var id : Int
    var name: String
    var description: String
    var tagline: String
    var url: String
    
    init?(json: JSON) {
        self.id = ("id" <~~ json)!
        self.name = ("name" <~~ json)!
        self.description = ("description" <~~ json)!
        self.tagline = ("tagline" <~~ json)!
        self.url = ("image_url" <~~ json)!
        
    }

}
