//
//  SingleBeerRouter.swift
//  fracApp
//
//  Created by José Eduardo Vieira Morango on 25/04/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import UIKit
class SingleBeerRouter : SingleBeerWireframe{
  
    weak var viewController: UIViewController?
    
    
    weak var view : UIViewController?
    
    static func assembleModule(_ beer: Beer) -> UIViewController{
        
        let viewController = UIStoryboard(name: "SingleBeer", bundle: nil).instantiateViewController(withIdentifier : "SingleBeerViewController") as! SingleBeerViewController
        
        let presenter  = SingleBeerPresenter()
        let router = SingleBeerRouter()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.beer = beer
        
        router.view = viewController
        
        
        return viewController
    }
    
    
}
