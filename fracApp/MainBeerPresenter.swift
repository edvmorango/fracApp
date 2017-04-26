//
//  MainPresenter.swift
//  fracApp
//
//  Created by José Eduardo Vieira Morango on 23/04/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import Foundation
import UIKit
protocol MainBeerDelegate{
    func onBeerSelected(_ beer: Beer?)
    func showBeers()
}

class MainBeerPresenter: MainBeerPresentation{

    weak var view: MainBeerView?
    var router : MainBeerWireframe!
    var interactor : MainBeerUseCase!

    var beers : [Beer] = [] {
        didSet{
            view?.showSearchResult(beers)
        }
    }
    
    func viewDidLoad() {}
    
    func onSearchBy(name: String?) { interactor.fetchBeers(name: name) }
    
    func onBeerSelected(_ beer: Beer) { router.presentSingleBeer(forBeer: beer) }
}


extension MainBeerPresenter : MainBeerInteractorOutput{
    func onFetchFailure() {
        view?.showCustomError()
    }

    func onFetchSuccess(_ beers: [Beer]) {
        self.beers = beers
    }
}
