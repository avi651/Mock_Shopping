//
//  ProductModel.swift
//  MockShopping
//
//  Created by Avinash Kumar on 02/08/23.
//

import Foundation

struct ProductModel: Identifiable, Decodable, Hashable {
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
extension ProductModel {
    var imageURL: URL {
        URL(string: image)!
    }
    var formatedRating: String {
        var result = ""
        for _ in 0...Int(rating.rate){
            result.append("★")
        }
        while result.count<5{
            result += "☆"
        }
        return result
    }
}

struct Rating: Codable, Hashable {
    let rate: Double
    // to remplace with let count when the api bug is fixed https://github.com/keikaavousi/fake-store-api/issues/31
    // let count: Int
    let manualCount: Int = Int.random(in: 0...500)
}

