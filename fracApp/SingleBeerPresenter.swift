//
//  SingleBeerPresenter.swift
//  fracApp
//
//  Created by José Eduardo Vieira Morango on 25/04/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import Foundation


class SingleBeerPresenter: SingleBeerPresentation{
 
    weak var view: SingleBeerView?

    var router: SingleBeerWireframe!
    var beer : Beer!
    
    func viewDidLoad() {
        view?.showSearchResult(beer)
    }
}
