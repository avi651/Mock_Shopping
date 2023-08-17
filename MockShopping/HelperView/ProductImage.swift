//
//  ProductImage.swift
//  MockShopping
//
//  Created by Avinash Kumar on 14/08/23.
//

import SwiftUI

struct ProductImage: View {
    @StateObject private var imageLoader = ImageLoader()
    let imageURL: URL
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.white)
                .frame(width: 170, height: 190, alignment: .center)
                .cornerRadius(12)
                .overlay(
                    ZStack {
                        ProgressView()
                        if imageLoader.image != nil {
                            HStack {
                                Spacer()
                                Image(uiImage: imageLoader.image!)
                                    .resizable()
                                    .compositingGroup()
                                    .aspectRatio(contentMode: .fit)
                                Spacer()
                            }
                        }
                    }.padding()
                )
        }
        .cornerRadius(12)
        .shadow(color: .gray, radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
        .onAppear {
            imageLoader.loadImage(with: imageURL)
        }
    }
}

//struct ProductImage_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductImage(imageURL: .constant(""))
//    }
//}
