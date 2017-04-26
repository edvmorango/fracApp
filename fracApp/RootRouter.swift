//
//  RootRouter.swift
//  fracApp
//
//  Created by José Eduardo Vieira Morango on 24/04/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//
import UIKit

class RootRouter: RootWireframe {
    
    func presentMainBeerScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = MainBeerRouter.assembleModule()
    }
}
