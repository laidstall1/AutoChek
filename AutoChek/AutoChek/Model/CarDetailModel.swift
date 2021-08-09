////
////  CarDetailModel.swift
////  AutoChek
////
////  Created by mac on 09/08/2021.
////
//
//import Foundation
//// MARK: - CarModel
//struct CarModel: Codable {
////    let features, carFeatures, modelFeatures: [JSONAny]?
//    let damageMedia: [DamageMedia]?
//    let id: String?
//    let year: Int?
////    let insured: Bool?
//    let mileage: Int?
//    let vin, licensePlate, engineNumber: String?
//    let price: Int?
//    let createdBy: String?
//    let marketplacePrice: Int?
////    let marketplaceVisible: Bool?
//    let marketplaceVisibleDate: String?
////    let isFeatured: Bool?
//    let reasonForSelling: String?
//    let imageURL: String?
//    let ownerID: String?
//    let model: Model?
//    let state, country, address, carManagerID: String?
//    let ownerType, transmission, fuelType, sellingCondition: String?
//    let bodyType: BodyType?
//    let city: String?
//    let marketplaceOldPrice: Int?
//    let createdAt, updatedAt, mileageUnit: String?
////    let hasWarranty, hasFinancing: Bool?
//    let interiorColor, exteriorColor, engineType: String?
//    let gradeScore: Double?
//    let installment: Int?
////    let depositReceived, isFirstOwner: Bool?
//    let firstOwnerName, firstOwnerPhone: String?
//    let loanValue: Int?
//    let websiteURL: String?
//    let stats: Stats?
////    let sold: Bool?
//    let soldDate: String?
////    let hasThreeDImage: Bool?
//
//    enum CodingKeys: String, CodingKey {
//        case  damageMedia, id, year, mileage, vin, licensePlate, engineNumber, price, createdBy, marketplacePrice, reasonForSelling
//        case imageURL = "imageUrl"
//        case ownerID = "ownerId"
//        case model, state, country, address
//        case carManagerID = "carManagerId"
//        case ownerType, transmission, fuelType, sellingCondition, bodyType, city, marketplaceOldPrice, marketplaceVisibleDate, createdAt, updatedAt, mileageUnit, interiorColor, exteriorColor, engineType, gradeScore, installment, depositReceived, firstOwnerName, loanValue
//        case websiteURL = "websiteUrl"
//        case stats, soldDate
//    }
//}
//
//// MARK: - BodyType
//struct BodyType: Codable {
//    let id: Int?
//    let name: String?
//    let imageURL: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case imageURL = "imageUrl"
//    }
//}
//
//// MARK: - DamageMedia
//struct DamageMedia: Codable {
//    let inspectionItems: [InspectionItem]?
//    let name, comment: String?
//}
//
//// MARK: - InspectionItem
//struct InspectionItem: Codable {
//    let medias: [Media]?
//    let name, comment: String?
//    let response: Response?
//    let condition: String?
//}
//
//// MARK: - Media
//struct Media: Codable {
//    let url: String?
//    let mediaType: String?
//}
//
//enum Response: String, Codable {
//    case bad = "bad"
//    case good = "good"
//}
//
//// MARK: - Model
//struct Model: Codable {
////    let modelFeatures: [JSONAny]?
//    let id: Int?
//    let name, imageURL, wheelType: String?
//    let make: BodyType?
////    let popular: Bool?
//
//    enum CodingKeys: String, CodingKey {
//        case  id, name
//        case imageURL = "imageUrl"
//        case wheelType, make
//    }
//}
//
//// MARK: - Stats
//struct Stats: Codable {
//    let webViewCount, webViewerCount, interestCount, testDriveCount: Int?
//    let appViewCount, appViewerCount, processedLoanCount: Int?
//}
//// MARK: - Encode/decode helpers
//
////class JSONNull: Codable, Hashable {
////
////    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
////        return true
////    }
////
////    public var hashValue: Int {
////        return 0
////    }
////
////    public init() {}
////
////    public required init(from decoder: Decoder) throws {
////        let container = try decoder.singleValueContainer()
////        if !container.decodeNil() {
////            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
////        }
////    }
////
////    public func encode(to encoder: Encoder) throws {
////        var container = encoder.singleValueContainer()
////        try container.encodeNil()
////    }
////}
////
////class JSONCodingKey: CodingKey {
////    let key: String
////
////    required init?(intValue: Int) {
////        return nil
////    }
////
////    required init?(stringValue: String) {
////        key = stringValue
////    }
////
////    var intValue: Int? {
////        return nil
////    }
////
////    var stringValue: String {
////        return key
////    }
////}
////
////class JSONAny: Codable {
////
////    let value: Any
////
////    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
////        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
////        return DecodingError.typeMismatch(JSONAny.self, context)
////    }
////
////    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
////        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
////        return EncodingError.invalidValue(value, context)
////    }
////
////    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
////        if let value = try? container.decode(Bool.self) {
////            return value
////        }
////        if let value = try? container.decode(Int64.self) {
////            return value
////        }
////        if let value = try? container.decode(Double.self) {
////            return value
////        }
////        if let value = try? container.decode(String.self) {
////            return value
////        }
////        if container.decodeNil() {
////            return JSONNull()
////        }
////        throw decodingError(forCodingPath: container.codingPath)
////    }
////
////    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
////        if let value = try? container.decode(Bool.self) {
////            return value
////        }
////        if let value = try? container.decode(Int64.self) {
////            return value
////        }
////        if let value = try? container.decode(Double.self) {
////            return value
////        }
////        if let value = try? container.decode(String.self) {
////            return value
////        }
////        if let value = try? container.decodeNil() {
////            if value {
////                return JSONNull()
////            }
////        }
////        if var container = try? container.nestedUnkeyedContainer() {
////            return try decodeArray(from: &container)
////        }
////        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
////            return try decodeDictionary(from: &container)
////        }
////        throw decodingError(forCodingPath: container.codingPath)
////    }
////
////    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
////        if let value = try? container.decode(Bool.self, forKey: key) {
////            return value
////        }
////        if let value = try? container.decode(Int64.self, forKey: key) {
////            return value
////        }
////        if let value = try? container.decode(Double.self, forKey: key) {
////            return value
////        }
////        if let value = try? container.decode(String.self, forKey: key) {
////            return value
////        }
////        if let value = try? container.decodeNil(forKey: key) {
////            if value {
////                return JSONNull()
////            }
////        }
////        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
////            return try decodeArray(from: &container)
////        }
////        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
////            return try decodeDictionary(from: &container)
////        }
////        throw decodingError(forCodingPath: container.codingPath)
////    }
////
////    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
////        var arr: [Any] = []
////        while !container.isAtEnd {
////            let value = try decode(from: &container)
////            arr.append(value)
////        }
////        return arr
////    }
////
////    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
////        var dict = [String: Any]()
////        for key in container.allKeys {
////            let value = try decode(from: &container, forKey: key)
////            dict[key.stringValue] = value
////        }
////        return dict
////    }
////
////    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
////        for value in array {
////            if let value = value as? Bool {
////                try container.encode(value)
////            } else if let value = value as? Int64 {
////                try container.encode(value)
////            } else if let value = value as? Double {
////                try container.encode(value)
////            } else if let value = value as? String {
////                try container.encode(value)
////            } else if value is JSONNull {
////                try container.encodeNil()
////            } else if let value = value as? [Any] {
////                var container = container.nestedUnkeyedContainer()
////                try encode(to: &container, array: value)
////            } else if let value = value as? [String: Any] {
////                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
////                try encode(to: &container, dictionary: value)
////            } else {
////                throw encodingError(forValue: value, codingPath: container.codingPath)
////            }
////        }
////    }
////
////    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
////        for (key, value) in dictionary {
////            let key = JSONCodingKey(stringValue: key)!
////            if let value = value as? Bool {
////                try container.encode(value, forKey: key)
////            } else if let value = value as? Int64 {
////                try container.encode(value, forKey: key)
////            } else if let value = value as? Double {
////                try container.encode(value, forKey: key)
////            } else if let value = value as? String {
////                try container.encode(value, forKey: key)
////            } else if value is JSONNull {
////                try container.encodeNil(forKey: key)
////            } else if let value = value as? [Any] {
////                var container = container.nestedUnkeyedContainer(forKey: key)
////                try encode(to: &container, array: value)
////            } else if let value = value as? [String: Any] {
////                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
////                try encode(to: &container, dictionary: value)
////            } else {
////                throw encodingError(forValue: value, codingPath: container.codingPath)
////            }
////        }
////    }
////
////    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
////        if let value = value as? Bool {
////            try container.encode(value)
////        } else if let value = value as? Int64 {
////            try container.encode(value)
////        } else if let value = value as? Double {
////            try container.encode(value)
////        } else if let value = value as? String {
////            try container.encode(value)
////        } else if value is JSONNull {
////            try container.encodeNil()
////        } else {
////            throw encodingError(forValue: value, codingPath: container.codingPath)
////        }
////    }
////
////    public required init(from decoder: Decoder) throws {
////        if var arrayContainer = try? decoder.unkeyedContainer() {
////            self.value = try JSONAny.decodeArray(from: &arrayContainer)
////        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
////            self.value = try JSONAny.decodeDictionary(from: &container)
////        } else {
////            let container = try decoder.singleValueContainer()
////            self.value = try JSONAny.decode(from: container)
////        }
////    }
////
////    public func encode(to encoder: Encoder) throws {
////        if let arr = self.value as? [Any] {
////            var container = encoder.unkeyedContainer()
////            try JSONAny.encode(to: &container, array: arr)
////        } else if let dict = self.value as? [String: Any] {
////            var container = encoder.container(keyedBy: JSONCodingKey.self)
////            try JSONAny.encode(to: &container, dictionary: dict)
////        } else {
////            var container = encoder.singleValueContainer()
////            try JSONAny.encode(to: &container, value: self.value)
////        }
////    }
////}
////
