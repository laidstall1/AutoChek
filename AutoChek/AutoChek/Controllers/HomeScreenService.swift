//
//  HomeScreenService.swift
//  AutoChek
//
//  Created by mac on 09/08/2021.
//

import Foundation
import Alamofire

struct HomeScreenService {
    fileprivate var baseURL = "https://api-prod.autochek.africa/v1/inventory"
    
    func fetchCars(endPoint: String, completion: @escaping (AFDataResponse<Data?>) -> Void) {
        AF.request(self.baseURL + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response(completionHandler: completion)
    }
}

//    fileprivate var baseURL = "https://api-prod.autochek.africa/v1/inventory/make?popular=true"
//
//    func fetchCarModels(from endPoint: String) {
//        AF.request(self.baseURL + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { response in
//            print("response in")
//        }
//    }
