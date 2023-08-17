//
//  CarousalView.swift
//  MockShopping
//
//  Created by Avinash Kumar on 11/08/23.
//

//import SwiftUI
//
//struct CarouselView: View {
//
//    @State var productModel: [ProductModel]
//
//    var body: some View {
//        TabView {
//            ForEach(productModel) { item in
////                Image(item)
////                    .resizable()
////                    .scaledToFill()
////                var fProducts: [ProductModel] = []
////                if let products = self.products  {
////                    if products.count >= 4 {
////                    fProducts = products[0...3].shuffled()
////                    }
////                }
//
//                AsyncImage(
//                    url: URL(string: item.image),
//                    content: { image in
//                        image.resizable()
//                            .aspectRatio(contentMode: .fit)
//                    },
//                    placeholder: {
//                        ProgressView()
//                    }
//                )
//            }
//        }
//        .tabViewStyle(PageTabViewStyle())
//    }
//}
//
////struct CarouselView_Previews: PreviewProvider {
////    static var previews: some View {
////        CarouselView()
////            .previewLayout(.fixed(width: 400, height: 300))
////    }
////}


import SwiftUI

struct ProductCarousel: View {
    private let screenSize = UIScreen.main.bounds
    //@EnvironmentObject var cart: CartViewModel
    let products: [ProductModel]
    @State private var product: ProductModel? = nil
    @State private var currentIndex: Int = 0
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    init(products: [ProductModel]) {
        self.products = products
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(CustomColor.DarkText)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(CustomColor.SecondaryBackground)
    }
    var body: some View {
        VStack(spacing:0) {
            TabView(selection: $currentIndex){
                ForEach(0..<products.count, id: \.self){index in
                    Button(action:{
                        withAnimation{
                            self.product = products[index]
                        }
                    }){
                        
                        HStack(alignment: .center){
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 100, height: 140, alignment: .center)
                                .cornerRadius(12)
                                .overlay(
                                    AsyncImage(
                                        url: URL(string: products[index].image),
                                        content: { image in
                                            image.resizable()
                                                .compositingGroup()
                                                .clipped(antialiased: true)
                                                .aspectRatio(contentMode: .fill)
                                                .clipped()
                                                .cornerRadius(12)
                                                .padding()
                                        },
                                        placeholder: {
                                            ProgressView()
                                        }
                                    )
                                )
                            VStack(alignment: .leading){
                                Text(products[index].title)
                                    .font(.subheadline)
                                    .lineLimit(3)
                                Text("\(products[index].price.format(f: ".2"))$")
                                    .bold()
                                    .padding(4)
                            }.foregroundColor(CustomColor.DarkText)
                        }.frame(width: screenSize.width - 16).shadow(color: CustomColor.DarkText.opacity(0.1), radius: 3, x: 1, y: 2)
                    }
                    .tag(index)
                }
            }
            .frame(height: 220)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .sheet(item: $product){product in
             
            }
            .onReceive(timer) { input in
                animateCarousel()
            }
        }
    }
    func animateCarousel(){
        if currentIndex <= 3 {
            withAnimation{
            currentIndex += 1
            }
        } else {
            withAnimation{
            currentIndex = 0
            }
        }
    }
}

struct ProductCarousel_Previews: PreviewProvider {
    static var previews: some View {
        ProductCarousel(products: ProductModel.sampleProducts)
    }
}
