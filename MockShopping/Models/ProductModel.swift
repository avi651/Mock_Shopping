//
//  ProductModel.swift
//  MockShopping
//
//  Created by Avinash Kumar on 02/08/23.
//

import Foundation

struct ProductModel: Codable, Identifiable {
    
        var id: Int
        var title: String
        var price: Double
        var description: String
        var category: String
        var image: String
        var rating: Rating
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case description
        case category
        case image
        case rating
    }
}

struct Rating : Codable, Equatable{
    var rate: Double
    var count: Double
    
    enum CodingKeys: String, CodingKey{
        case rate
        case count
    }
}

//extension ProductModel {
//    var imageURL: URL {
//        URL(string: image )!
//    }
//}

extension ProductModel {
    static var sampleProducts: [ProductModel] {
        let response: [ProductModel]? = try? Bundle.main.loadAndDecodeJSON(filename: "products")
        return response ?? [ProductModel(id: 1, title: "noproduct", price: 10.5, description: "noproduct", category: "noproduct", image: "noproduct", rating: Rating(rate: 10.0, count: 1.1))]
    }
}
