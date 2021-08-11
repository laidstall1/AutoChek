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

//{\"carMediaList\":[{\"id\":546578,\"name\":\"Car Back\",\"url\":\"https://media.autochek.africa/file/1NLLbVhy.webp\",\"createdAt\":\"2021-08-10T16:34:16.397Z\",\"type\":\"image/webp\"},{\"id\":546579,\"name\":\"Car Back\",\"url\":\"https://media.autochek.africa/file/1NLLbVhy.webp\",\"createdAt\":\"2021-08-10T16:34:16.398Z\",\"type\":\"image/webp\"},{\"id\":546583,\"name\":\"car front\",\"url\":\"https://media.autochek.africa/file/SfkWv0n9.webp\",\"createdAt\":\"2021-08-10T16:34:16.870Z\",\"type\":\"image/webp\"},{\"id\":546586,\"name\":\"car front\",\"url\":\"https://media.autochek.africa/file/SfkWv0n9.webp\",\"createdAt\":\"2021-08-10T16:34:16.944Z\",\"type\":\"image/webp\"},{\"id\":546598,\"name\":\"Car Interior\",\"url\":\"https://media.autochek.africa/file/2uqQu7sj.webp\",\"createdAt\":\"2021-08-10T16:34:20.764Z\",\"type\":\"image/webp\"},{\"id\":546599,\"name\":\"Car Interior\",\"url\":\"https://media.autochek.africa/file/2uqQu7sj.webp\",\"createdAt\":\"2021-08-10T16:34:20.765Z\",\"type\":\"image/webp\"},{\"id\":546585,\"name\":\"Car Left\",\"url\":\"https://media.autochek.africa/file/Viqei53o.webp\",\"createdAt\":\"2021-08-10T16:34:16.936Z\",\"type\":\"image/webp\"},{\"id\":546587,\"name\":\"Car Left\",\"url\":\"https://media.autochek.africa/file/Viqei53o.webp\",\"createdAt\":\"2021-08-10T16:34:16.951Z\",\"type\":\"image/webp\"},{\"id\":546588,\"name\":\"Car Left Back\",\"url\":\"https://media.autochek.africa/file/4Tn8NrMJ.webp\",\"createdAt\":\"2021-08-10T16:34:17.314Z\",\"type\":\"image/webp\"},{\"id\":546589,\"name\":\"Car Left Back\",\"url\":\"https://media.autochek.africa/file/4Tn8NrMJ.webp\",\"createdAt\":\"2021-08-10T16:34:17.315Z\",\"type\":\"image/webp\"},{\"id\":546582,\"name\":\"Car Left Front\",\"url\":\"https://media.autochek.africa/file/w6lDhVvV.webp\",\"createdAt\":\"2021-08-10T16:34:16.865Z\",\"type\":\"image/webp\"},{\"id\":546584,\"name\":\"Car Left Front\",\"url\":\"https://media.autochek.africa/file/w6lDhVvV.webp\",\"createdAt\":\"2021-08-10T16:34:16.866Z\",\"type\":\"image/webp\"},{\"id\":546590,\"name\":\"Car Right\",\"url\":\"https://media.autochek.africa/file/chVcZGl0.webp\",\"createdAt\":\"2021-08-10T16:34:17.565Z\",\"type\":\"image/webp\"},{\"id\":546591,\"name\":\"Car Right\",\"url\":\"https://media.autochek.africa/file/chVcZGl0.webp\",\"createdAt\":\"2021-08-10T16:34:17.566Z\",\"type\":\"image/webp\"},{\"id\":546576,\"name\":\"Car Right Back\",\"url\":\"https://media.autochek.africa/file/ljHlG6Pm.webp\",\"createdAt\":\"2021-08-10T16:34:16.327Z\",\"type\":\"image/webp\"},{\"id\":546577,\"name\":\"Car Right Back\",\"url\":\"https://media.autochek.africa/file/ljHlG6Pm.webp\",\"createdAt\":\"2021-08-10T16:34:16.328Z\",\"type\":\"image/webp\"},{\"id\":546581,\"name\":\"Car Right Front\",\"url\":\"https://media.autochek.africa/file/mpoQn71N.webp\",\"createdAt\":\"2021-08-10T16:34:16.549Z\",\"type\":\"image/webp\"},{\"id\":546580,\"name\":\"Car Right Front\",\"url\":\"https://media.autochek.africa/file/mpoQn71N.webp\",\"createdAt\":\"2021-08-10T16:34:16.548Z\",\"type\":\"image/webp\"},{\"id\":546597,\"name\":\"Dashboard\",\"url\":\"https://media.autochek.africa/file/xjZRlgJ8.webp\",\"createdAt\":\"2021-08-10T16:34:20.535Z\",\"type\":\"image/webp\"},{\"id\":546596,\"name\":\"Dashboard\",\"url\":\"https://media.autochek.africa/file/xjZRlgJ8.webp\",\"createdAt\":\"2021-08-10T16:34:20.534Z\",\"type\":\"image/webp\"},{\"id\":546592,\"name\":\"Engine\",\"url\":\"https://media.autochek.africa/file/tAuoLbHa.webp\",\"createdAt\":\"2021-08-10T16:34:17.576Z\",\"type\":\"image/webp\"},{\"id\":546593,\"name\":\"Engine\",\"url\":\"https://media.autochek.africa/file/tAuoLbHa.webp\",\"createdAt\":\"2021-08-10T16:34:17.576Z\",\"type\":\"image/webp\"},{\"id\":546594,\"name\":\"Tyres\",\"url\":\"https://media.autochek.africa/file/T6hbqHWl.webp\",\"createdAt\":\"2021-08-10T16:34:17.791Z\",\"type\":\"image/webp\"},{\"id\":546595,\"name\":\"Tyres\",\"url\":\"https://media.autochek.africa/file/T6hbqHWl.webp\",\"createdAt\":\"2021-08-10T16:34:17.792Z\",\"type\":\"image/webp\"}],\"pagination\":{\"total\":24,\"currentPage\":1,\"pageSize\":100}}
