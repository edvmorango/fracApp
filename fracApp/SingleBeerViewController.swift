//
//  SingleBeerViewController.swift
//  fracApp
//
//  Created by José Eduardo Vieira Morango on 25/04/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import UIKit
import SDWebImage

class SingleBeerViewController: UIViewController{

    @IBOutlet weak var tvDesc: UITextView!
    @IBOutlet weak var lbTag: UILabel!
    @IBOutlet weak var imgBeer: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    var presenter: SingleBeerPresentation!
   
    override func viewDidLoad() {
        presenter.viewDidLoad()
    }
    
}

extension SingleBeerViewController: SingleBeerView {
    
    func showSearchResult(_ beer: Beer) {
        tvDesc.text = beer.description
        lbTag.text = beer.tagline
        lbName.text = beer.name
        imgBeer.sd_setImage(with: URL(string: beer.url)!)
    }
}
