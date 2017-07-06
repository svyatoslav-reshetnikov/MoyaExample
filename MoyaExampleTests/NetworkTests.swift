//
//  NetworkTests.swift
//  MoyaExampleTests
//
//  Created by SVYAT on 06.07.17.
//  Copyright © 2017 HiT2B. All rights reserved.
//

import Quick
import Nimble
import RxSwift
import Moya
@testable import MoyaExample

class NetworkTests: QuickSpec {
    
    override func spec() {
        var testProvider: RxMoyaProvider<MoyaExampleService>!
        let disposeBag = DisposeBag()
        
        beforeSuite {
            testProvider = RxMoyaProvider<MoyaExampleService>(stubClosure: MoyaProvider.immediatelyStub)
        }
        
        describe("testProvider") {
            it("should be not nil") {
                expect(testProvider).toNot(beNil())
            }
        }
        
        describe("getRestaurants") {
            it("should return not nil RestaurantsResponse object") {
                testProvider.request(.getRestaurants())
                    .mapObject(RestaurantsResponse.self)
                    .subscribe(
                        onNext: { response in
                            expect(response).toNot(beNil())
                    }
                    )
                    .addDisposableTo(disposeBag)
            }
        }
    }
}
