//
//  SingleBeerContract.swift
//  fracApp
//
//  Created by José Eduardo Vieira Morango on 25/04/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import UIKit

protocol SingleBeerView : class{
    var presenter : SingleBeerPresentation! { get set }
    
    func showSearchResult(_ beer: Beer)
}

protocol SingleBeerPresentation : class{
    
    weak var view : SingleBeerView? {get set}
    
    func viewDidLoad()
}

protocol SingleBeerWireframe : class {
    static func assembleModule(_ beer: Beer) -> UIViewController
}
