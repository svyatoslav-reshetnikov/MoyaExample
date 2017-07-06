//
//  ViewController.swift
//  MoyaExample
//
//  Created by SVYAT on 06.07.17.
//  Copyright © 2017 HiT2B. All rights reserved.
//

import UIKit
import Moya
import ObjectMapper
import Moya_ObjectMapper
import RxSwift

class RestaurantsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var restaurants: [Restaurant] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //getRestaurants()
        getRestaurantsRxSwift()
    }
    
    func getRestaurants() {
        let provider = MoyaProvider<MoyaExampleService>()
        provider.request(.getRestaurants()) { result in
            switch result {
            case .success(let response):
                let restaurantsResponse = try? response.mapObject(RestaurantsResponse.self)
                self.restaurants = restaurantsResponse?.data ?? []
            case .failure(let error):
                print(error.errorDescription ?? "Unknown error")
            }
        }
    }
    
    func getRestaurantsRxSwift() {
        let provider = RxMoyaProvider<MoyaExampleService>(plugins: [NetworkLoggerPlugin(verbose: true)])
        provider.request(.getRestaurants())
            .mapObject(RestaurantsResponse.self)
            .catchError { error in
                // Do something with error
                return Observable.error(error)
            }
            .subscribe(
                onNext: { response in
                    self.restaurants = response.data
                }
            )
            .addDisposableTo(disposeBag)
    }
}

extension RestaurantsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as? RestaurantCell
        
        cell?.setup(restaurants[indexPath.row])
        
        return cell!
    }
}
