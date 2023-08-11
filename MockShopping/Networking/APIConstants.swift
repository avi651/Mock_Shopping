//
//  APIConstants.swift
//  MockShopping
//
//  Created by Avinash Kumar on 03/08/23.
//

import Foundation
import Network

struct APIConstants {
    public static var productURL = "https://fakestoreapi.com/products"
    public static var userURL = "https://randomuser.me/api"
}

enum ProductListEndpoint: String, CaseIterable {
    case all = "All"
    case jewelery = "Jewelery"
    case electronics = "electronics"
    case men = "men's clothing"
    case women = "women's clothing"
    
    var description: String {
        switch self {
        case .all: return "/"
        case .jewelery: return "/category/jewelery"
        case .electronics: return "/category/electronics"
        case .men: return "/category/men's%20clothing"
        case .women: return "/category/women's%20clothing"
        }
    }
}
