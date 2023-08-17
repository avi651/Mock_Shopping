//
//  ProductCollectionItem.swift
//  MockShopping
//
//  Created by Avinash Kumar on 14/08/23.
//

import SwiftUI

struct ProductCollectionItem: View {
    let product: ProductModel
    var body: some View {
        VStack {
            ProductImage(imageURL: product.imageURL)
            Text(product.title)
                .foregroundColor(CustomColor.DarkText)
                .bold()
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Text("\(product.price.format(f: ".2"))$").bold()
                .foregroundColor(CustomColor.DarkText)
            HStack(spacing: 2) {
                Text("\(product.formatedRating)").font(.title3)
                    .foregroundColor(CustomColor.DarkText)
            }
        }.padding(8)
    }
}

struct ProductCollectionItem_Previews: PreviewProvider {
    static var previews: some View {
        ProductCollectionItem(product: ProductModel.sampleProducts[0])
    }
}
