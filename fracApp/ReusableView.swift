//
//  ReusableView.swift
//  fracApp
//
//  Created by José Eduardo Vieira Morango on 23/04/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import UIKit
import Foundation
extension ReusableView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UIViewController: ReusableView{}
extension UIStoryboard{
    func instantiateViewController<T: ReusableView>() -> T where T: ReusableView {
        return instantiateViewController(withIdentifier: T.reuseIdentifier) as! T
    }

}
