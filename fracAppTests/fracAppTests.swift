//
//  fracAppTests.swift
//  fracAppTests
//
//  Created by José Eduardo Vieira Morango on 23/04/17.
//  Copyright © 2017 José Eduardo Vieira Morango. All rights reserved.
//

import XCTest
import RxSwift
import RxTest
import RxBlocking
@testable import fracApp

class fracAppTests: XCTestCase {
    
    var scheduler: TestScheduler!
    var subscription: Disposable!
    
    
    
    override func setUp() {
        super.setUp()
        scheduler = TestScheduler(initialClock: 0)
    }
    
    override func tearDown() {
        scheduler.scheduleAt(1000){
            self.subscription.dispose()
        }
        super.tearDown()
    }
    
    func testExample() {
  
    }
    
    func testPerformanceExample() {
        self.measure {
    
        }
    }
    
}
