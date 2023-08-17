//
//  ProductCollectionView.swift
//  MockShopping
//
//  Created by Avinash Kumar on 14/08/23.
//

import SwiftUI

struct ProductCollectionView: View {
    @EnvironmentObject var cart: CartViewModel
    let products: [ProductModel]
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    @State private var product: ProductModel? = nil
    
    var body: some View {
        LazyVGrid(columns: columns){
            ForEach(products){product in
                VStack {
                    Button(action:{self.product = product}){
                        ProductCollectionItem(product: product)
                    }
                    Button(action: {
                        withAnimation{
                            cart.addToCart(addedProduct: product, quantity: 1)
                        }
                    }, label: {
                        HStack {
                            Image(systemName: "cart.badge.plus")
                            Text("Add to cart")
                                .font(.caption)
                                .bold()
                        }
                        .padding(8)
                        .background(CustomColor.SecondaryBackground)
                        .cornerRadius(18)
                    }).accessibility(identifier: "Add to cart\(product.id)")
                }
                .background(CustomColor.SecondaryBackground
                                .cornerRadius(16)
                                .shadow(color: CustomColor.DarkText.opacity(0.05), radius: 2, x: 0.0, y: 0.0))
            }
        }.sheet(item: $product){product in
            //ProductView(product: product).environmentObject(cart)
        }
    }
}

struct ProductCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCollectionView(products: ProductModel.sampleProducts)
    }
}
