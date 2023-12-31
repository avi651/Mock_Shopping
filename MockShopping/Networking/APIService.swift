//
//  APIService.swift
//  MockShopping
//
//  Created by Avinash Kumar on 03/08/23.
//

import Foundation

class APIService: APIServiceProtocol {
    
    func fetchProducts(type: String,completion: @escaping (Result<[ProductModel], APIError>) -> Void) {
        let url = fetchProductsData(type: type)
        URLSessionsServices.fetch(type: [ProductModel].self, url: url, httpMethod: "GET", completion: completion)
    }

    func fetchUser(completion: @escaping (Result<UserAPIResults, APIError>) -> Void) {
        let url = fetchUsersData()
        URLSessionsServices.fetch(type: UserAPIResults.self, url: url, httpMethod: "GET", completion: completion)
    }
    
    
    private func fetchProductsData(type: String) -> URL? {
        let components = URLComponents(string: "\(APIConstants.productURL)\(type.description)")
        return components?.url
    }
    
    private func fetchUsersData() -> URL? {
        let components = URLComponents(string: APIConstants.userURL)
        return components?.url
    }
}
