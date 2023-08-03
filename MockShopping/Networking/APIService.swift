//
//  APIService.swift
//  MockShopping
//
//  Created by Avinash Kumar on 03/08/23.
//

import Foundation

class APIService: APIServiceProtocol {
    
    func fetchProducts(completion: @escaping (Result<[ProductModel], APIError>) -> Void) {
        let url = fetchProductsData()
        URLSessionsServices.fetch(type: [ProductModel].self, url: url, httpMethod: "GET", completion: completion)
    }

    func fetchUser(completion: @escaping (Result<UserAPIResults, APIError>) -> Void) {
        let url = fetchUsersData()
        URLSessionsServices.fetch(type: UserAPIResults.self, url: url, httpMethod: "GET", completion: completion)
    }
    
    
    private func fetchProductsData() -> URL? {
        var components = URLComponents(string: APIConstants.productURL)
        return components?.url
    }
    
    private func fetchUsersData() -> URL? {
        var components = URLComponents(string: APIConstants.userURL)
        return components?.url
    }
}
