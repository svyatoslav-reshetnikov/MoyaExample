//
//  RestaurantsResponse.swift
//  MoyaExample
//
//  Created by SVYAT on 06.07.17.
//  Copyright © 2017 HiT2B. All rights reserved.
//

import ObjectMapper

struct RestaurantsResponse {
    var data = [Restaurant]()
    var error: String?
}

extension RestaurantsResponse: Mappable {
    
    init?(map: Map) {}
    
    // Mappable
    mutating func mapping(map: Map) {
        data <- map["data"]
        error <- map["error"]
    }
}
