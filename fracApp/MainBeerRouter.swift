//
//  MainRouter.swift
//  fracApp
//
//  Created by José Eduardo Vieira Morango on 23/04/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import UIKit
class MainBeerRouter : MainBeerWireframe{
    
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController{
        
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier : "MainBeerViewController") as! MainBeerViewController
        
        let presenter  = MainBeerPresenter()
        let router = MainBeerRouter()
        let interactor = MainBeerInteractor()

        let navigation = UINavigationController(rootViewController: viewController)

        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        router.viewController = viewController
        
        interactor.output = presenter
        
        return navigation
    }
    
    
    func presentSingleBeer(forBeer beer: Beer) {
        let singleBeerViewController = SingleBeerRouter.assembleModule(beer)
        viewController?.navigationController!.pushViewController(singleBeerViewController, animated: false)
    }
}
