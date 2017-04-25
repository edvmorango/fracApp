//
//  MainBeerContract.swift
//  fracApp
//
//  Created by José Eduardo Vieira Morango on 23/04/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import UIKit


protocol MainBeerView : class{
    var presenter : MainBeerPresentation! { get set }
    
    func showCustomError()
    func showSearchResult(_ beers: [Beer])
}


protocol MainBeerPresentation : class{
    
    weak var view : MainBeerView? {get set}
    var interactor : MainBeerUseCase! {get set}
    var router : MainBeerWireframe! {get set}
    
    func viewDidLoad()
    func onSearchBy(name: String?)
    func onBeerSelected(_ beer: Beer)
    
}

protocol MainBeerUseCase : class{
    weak var output: MainBeerInteractorOutput! {get set}
    
    func fetchBeers(name: String?)
}

protocol MainBeerInteractorOutput : class{
    func onFetchSuccess( _ beers: [Beer])
    func onFetchFailure()
}

protocol MainBeerWireframe : class {
    weak var viewController : UIViewController? {get set}
    
    func presentDetails(forBeer beer: Beer)
    
    static func assembleModule() -> UIViewController
    
    
}
