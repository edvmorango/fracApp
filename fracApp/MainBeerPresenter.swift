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
    
    func viewDidLoad() {
        interactor.fetchBeers()
    }
    
    func onSearchBy(name: String?) {
        
        
    }
   
    func onBeerSelected(_ beer: Beer) {
       
    }
    

}


extension MainBeerPresenter : MainBeerInteractorOutput{
    func onFetchFailure(message: String) {
    
        // Vai invocar o reload
        
    }

    func onFetchSuccess(_ beers: [Beer]) {
        print("Aqueo \(beers.count)")
        self.beers = beers
        
    }




}
