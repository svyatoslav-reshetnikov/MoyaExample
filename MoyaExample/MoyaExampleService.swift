//
//  MoyaExampleService.swift
//  MoyaExample
//
//  Created by SVYAT on 06.07.17.
//  Copyright © 2017 HiT2B. All rights reserved.
//

import Moya

enum MoyaExampleService {
    case getRestaurants()
}

extension MoyaExampleService: TargetType {
    var baseURL: URL { return URL(string: "http://moya-example.svyatoslav-reshetnikov.ru")! }
    var path: String {
        switch self {
        case .getRestaurants:
            return "/restaurants.json"
        }
    }
    var method: Moya.Method {
        return .get
    }
    var parameters: [String: Any]? {
        return nil
    }
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    var sampleData: Data {
        return Data()
    }
    var task: Task {
        return .request
    }
}
