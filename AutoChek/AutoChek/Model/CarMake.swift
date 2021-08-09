//
//  CarModel.swift
//  AutoChek
//
//  Created by mac on 09/08/2021.
//

import Foundation

struct CarMake: Codable {
    let makeList: [MakeList]
}

struct MakeList: Codable {
    let id: Int
    let name: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "imageUrl"
    }
}

