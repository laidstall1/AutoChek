//
//  CarMediaModel.swift
//  AutoChek
//
//  Created by mac on 10/08/2021.
//

import Foundation

struct CarModel: Codable {
    let carMediaList: [CarMediaList]?
    let pagination: Pagination?
}

// MARK: - CarMediaList
struct CarMediaList: Codable {
    let id: Int?
    let name: String?
    let url: String?
    let createdAt: String?
    let type: String?
}
