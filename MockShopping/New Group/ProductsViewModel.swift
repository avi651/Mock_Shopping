//
//  ProductsViewModel.swift
//  MockShopping
//
//  Created by Avinash Kumar on 03/08/23.
//

import Foundation
import Network

class ProductsViewModel: ObservableObject {
    
    private var networkConnectivity = NWPathMonitor()
    @Published var productType: String = ""
    @Published var products: [ProductModel]?
    @Published var state: FetchState = .good
    
    var service: APIServiceProtocol
    
    
    init(apiService: APIServiceProtocol = APIService()) {
        self.service = apiService
        networkConnectivity.start(queue: DispatchQueue.global(qos: .userInitiated))
    }
    
    internal func loadMore() {
        let productDescription = NSString(string: productType.description).removingPercentEncoding!
        fetchProducts(with: productDescription)
    }
    
    /// For Carousal 
    var featuredProduct : [ProductModel] {
        var fProducts: [ProductModel] = []
        if let products = self.products  {
            if products.count >= 4 {
            fProducts = products[0...3].shuffled()
            }
        }
        return fProducts
    }

    private func fetchProducts(with type: String) {
        switch networkConnectivity.currentPath.status {
              case .satisfied: // connected to internet
                 guard state == FetchState.good else {
                    return
                 }
                 
                 state = .isLoading
                 
            service.fetchProducts(type: type) { [weak self]  result in
                     DispatchQueue.main.async {
                         switch result {
                            case .success(let results):
                             
                             self?.products = results
                             
                             if results.count == 0 {
                                 self?.state = .noResults
                             } else {
                                 self?.state = .good
                             }
                             print("fetched products \(results)")
                            case .failure(let error):
                             print("error loading products: \(error)")
                             self?.state = .error(error.localizedDescription)
                         }
                     }
                 }
            
              default:
                 print("Unable to fetch Data")
        }
        
    }
}
