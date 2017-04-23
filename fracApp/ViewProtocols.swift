//
//  ViewProtocols.swift
//  fracApp
//
//  Created by José Eduardo Vieira Morango on 23/04/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import Foundation


protocol ReusableView: class {}

protocol NibLoadableView: class { }

protocol IndicatableView: class {
    func showActivityIndicator()
    func hideActivityIndicator()
}
