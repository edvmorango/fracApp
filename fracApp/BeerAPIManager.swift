//
//  BeerAPIManager.swift
//  fracApp
//
//  Created by José Eduardo Vieira Morango on 23/04/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import Alamofire


struct BeerAPIManager{
    let provider : RxMoyaProvider<BeerAPI>
    let bag = DisposeBag()
    
    init() {
        provider = RxMoyaProvider<BeerAPI>()
    }
}

extension BeerAPIManager{
    public func listBeers(name: String? = nil) -> Observable<[Beer]>{
        return provider.request(BeerAPI.filteredBeers(name: name)).map{ xt in
            print(xt.request?.url)
            return xt
            }
                .filterSuccessfulStatusCodes()
                .map{ [Beer].from(jsonArray: $0.getJSONArray()) ?? []}
    }

}
