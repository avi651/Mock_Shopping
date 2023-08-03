//
//  FetchState.swift
//  MockShopping
//
//  Created by Avinash Kumar on 03/08/23.
//

import Foundation

enum FetchState: Comparable {
    case good
    case isLoading
    case loadedAll
    case noResults
    case error(String)
}

