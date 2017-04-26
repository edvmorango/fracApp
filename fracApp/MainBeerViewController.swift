//
//  ViewController.swift
//  fracApp
//
//  Created by José Eduardo Vieira Morango on 23/04/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SDWebImage
class MainBeerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var presenter: MainBeerPresentation!
    fileprivate var bag = DisposeBag()
    var beers : [Beer] = []{
        didSet{
            tableView.reloadData()
        }
    }
    
    fileprivate var searchObs : Observable<String?>!
    
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        searchObs = searchBar.rx.text.throttle(0.5, scheduler: MainScheduler.instance).shareReplay(1)
        
        searchObs.subscribe(onNext: { [weak self] value in
                self?.presenter.onSearchBy(name: value)})
            .addDisposableTo(bag)
    }
    
    func setupLayout(){
        //MainBeerCell customization
        tableView.separatorColor = UIColor.white
        
        //SearchBar customization
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1).cgColor
        
        //SearchBarText customization
        let text: UITextField = searchBar.value(forKey: "searchField") as! UITextField
        text.backgroundColor = UIColor(red: 107/255, green: 181/255, blue: 228/255, alpha: 1)
        
        let leftIcon = text.leftView as! UIImageView
        leftIcon.image = leftIcon.image?.withRenderingMode(.alwaysTemplate)
        leftIcon.tintColor = UIColor.white
        
        let rightIcon = text.value(forKey: "clearButton") as! UIButton
        rightIcon.setImage(rightIcon.imageView?.image?.withRenderingMode(.alwaysTemplate), for: .normal)
        rightIcon.tintColor = UIColor.white

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onBeerSelected(beers[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let beer =  beers[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MainBeerCell
        cell.lbName.text = beer.name
        cell.lbDesc.text = beer.description
        cell.imgBeer.sd_setImage(with: URL(string: beer.url))
        return cell
    }
}

extension MainBeerViewController: MainBeerView {
    
    func showSearchResult(_ beers: [Beer]) {
        self.beers = beers
    }

    func showCustomError() {
        let alertController = UIAlertController(title: "Aviso", message: "Não foi possível se conectar a internet.", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Tentar novamente", style: .default, handler: { (pAlert) in
            self.searchObs.subscribe(onNext: {[weak self] value in
                    self?.presenter.onSearchBy(name: value)})
                .addDisposableTo(self.bag)
        })
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
