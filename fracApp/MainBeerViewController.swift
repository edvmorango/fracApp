//
//  ViewController.swift
//  fracApp
//
//  Created by José Eduardo Vieira Morango on 23/04/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import UIKit

class MainBeerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var presenter: MainBeerPresentation!

    var beers : [Beer] = []{
        didSet{
            print("Aquii")
            tableView.reloadData()
        }
    }
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        print(beers.count)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = beers[index].name

        return cell
    }
}

extension MainBeerViewController: MainBeerView {
    
    func showSearchResult(_ beers: [Beer]) {
        self.beers = beers
    }

    func showCustomError(_ message: String?) {
        
    }
    
}
