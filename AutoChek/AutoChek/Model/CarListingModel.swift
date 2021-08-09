//
//  CarList.swift
//  AutoChek
//
//  Created by mac on 09/08/2021.
//

import Foundation

// MARK: - CarModel
struct CarListingModel: Codable {
    let result: [CarDetailModel]
    let pagination: Pagination?
}

// MARK: - Pagination
struct Pagination: Codable {
    let total, currentPage, pageSize: Int?
}

// MARK: - Result
struct CarDetailModel: Codable {
    let id, title: String?
    let imageURL: String?
    let year: Int?
    let marketplacePrice, marketplaceOldPrice: Int?
 

    enum CodingKeys: String, CodingKey {
        case id, title
        case imageURL = "imageUrl"
        case marketplacePrice, marketplaceOldPrice
        case year
    }
}




//struct CarListingModel: Codable {
//    let result: [CarDetailModel]
//    let pagination: Pagination
//}
//
//// MARK: - Pagination
//struct Pagination: Codable {
//    let total, currentPage, pageSize: Int?
//}
//
//// MARK: - Result
//struct CarDetailModel: Codable {
//    let id, title: String?
//    let imageURL: String?
//    let year: String?
//    let marketplacePrice, marketplaceOldPrice: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case id, title
//        case imageURL = "imageUrl"
//        case year, marketplacePrice, marketplaceOldPrice
//    }
//}
