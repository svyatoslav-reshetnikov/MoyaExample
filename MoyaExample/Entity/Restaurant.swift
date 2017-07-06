//
//  Restaurant.swift
//  MoyaExample
//
//  Created by SVYAT on 06.07.17.
//  Copyright © 2017 HiT2B. All rights reserved.
//

import ObjectMapper

struct Restaurant {
    var id: Int?
    var title: String?
    var address: String?
    var cuisine: String?
}

extension Restaurant: Mappable {
    
    init?(map: Map) {}
    
    // Mappable
    mutating func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        address <- map["address"]
        cuisine <- map["cuisine"]
    }
}
