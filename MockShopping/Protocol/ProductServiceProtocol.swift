//
//  ProductServiceProtocol.swift
//  MockShopping
//
//  Created by Avinash Kumar on 03/08/23.
//

import Foundation

protocol APIServiceProtocol{
    func fetchProducts(completion: @escaping(Result<[ProductModel], APIError>) -> Void)
    func fetchUser(completion: @escaping(Result<UserAPIResults, APIError>) -> Void)
}
