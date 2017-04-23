//
//  Response+JSON.swift
//  fracApp
//
//  Created by José Eduardo Vieira Morango on 23/04/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import Moya
import Gloss
extension Response{

    func getJSON() -> JSON{
        return try! self.mapJSON() as! JSON
    }
    func getJSONArray() -> [JSON]{
        return try! self.mapJSON() as! [JSON]
    }

}
