//
//  CartViewModel.swift
//  MockShopping
//
//  Created by Avinash Kumar on 14/08/23.
//

import Foundation
import SwiftUI

class CartViewModel: ObservableObject{
    @Published var cartProduct: [ProductModel] = []
    @Published var cartProductDic: [ProductModel: Int] = [:]
    @Published var totalPrice: Double = 0
    @Published var showShowcaseSheet: Bool = false
    
    /// adding a product with the quantity on our cart
    /// - Parameters:
    ///   - addedProduct: product we want to add
    ///   - quantity: quantity of product we want to add
    func addToCart(addedProduct: ProductModel, quantity: Int){
        let products = cartProductDic.map({$0.key})
        // if we don't have any product we just create it with our quantity and leave the func
        if products.isEmpty {
            withAnimation{
                cartProductDic[addedProduct] = quantity
            }
            return
        }
        for product in products {
            // if we already have the product we check our product and add the quantity
            if addedProduct.id == product.id {
                withAnimation{
                    cartProductDic[product]! += quantity
                }
            } else {
                // if we have products but dont have this one, we create it with the quantity
                if !products.contains(where: {$0.id == addedProduct.id}){
                    withAnimation{
                        cartProductDic[addedProduct] = quantity
                    }
                }
            }
        }
    }
    
    func changeQuantity(product: ProductModel,quantity: Int){
        cartProductDic[product] = quantity
    }
    
    func calculateTotalPrice(){
        var totalprice: Double = 0
        for (product,quantity) in cartProductDic {
            totalprice += product.price * Double(quantity)
        }
        withAnimation{
            totalPrice = totalprice
        }
    }
    
    func removeFromCart(toRemove: ProductModel){
        cartProductDic.removeValue(forKey: toRemove)
    }
}