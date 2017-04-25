//
//  MainBeerInteractor.swift
//  fracApp
//
//  Created by José Eduardo Vieira Morango on 23/04/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import UIKit
import RxSwift

class MainBeerInteractor : MainBeerUseCase{
   
  
    weak var output: MainBeerInteractorOutput!
    private var bag = DisposeBag()
    var api = BeerAPIManager()

    func fetchBeers(name: String? = nil) {
        
        api.listBeers(name: name)
            .subscribe(onNext:{
                         self.output.onFetchSuccess($0)
                       },
                       onError: { _ in
                         self.output.onFetchFailure()
                       })
                    .addDisposableTo(bag)
    }
    
    
}
