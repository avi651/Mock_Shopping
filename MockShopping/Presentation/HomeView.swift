//
//  HomeView.swift
//  MockShopping
//
//  Created by Avinash Kumar on 10/08/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var productViewModel: ProductsViewModel
    @Binding var presentSideMenu: Bool
    @State var pickedCategory: ProductListEndpoint = .all
    @EnvironmentObject var cart: CartViewModel
    
    var body: some View {
        NavigationView{
            ZStack{
                CustomColor.Background.edgesIgnoringSafeArea(.all)
                ScrollView(.vertical) {
                    VStack(alignment: .center){
                        Text("Hello ! \n Enjoy your shopping 🥳") .font(.title).bold()
                            .foregroundColor(CustomColor.DarkText)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        CustomPicker(choosenCategory: $pickedCategory).onChange(of: pickedCategory, perform: { value in
                            
                            print("The Value is  --->")
                            print(value)
                            print(pickedCategory.description)
                            DispatchQueue.main.async {
                                productViewModel.productType = pickedCategory.description
                                productViewModel.loadMore()
                            }
                        })
                        if productViewModel.products != nil {
                        
                            ProductCarousel(products: productViewModel.featuredProduct).frame(maxWidth: .infinity).environmentObject(cart)
                        } else {
                            ProgressView()
                                .progressViewStyle(.circular)
                                .frame(maxWidth: .infinity)
                        }
                        
                        if productViewModel.products != nil {
                            ProductCollectionView(products: productViewModel.products!) .environmentObject(cart)
                        } else {
                            ProgressView()
                                .progressViewStyle(.circular)
                                .frame(maxWidth: .infinity)
                        }
                    }
                }.onAppear{
                    productViewModel.productType = ProductListEndpoint.all.description
                    productViewModel.loadMore()
                }
            }.navigationBarTitleDisplayMode(.large)
                .navigationBarItems(
                    leading:
                        Button(action: {
                            presentSideMenu.toggle()
                        }, label: {
                            NavigationSlideIcon()
                        }),
                    trailing: HStack{
                        Button(action: {
                            presentSideMenu.toggle()
                        }, label: {
                            ProfileIcon().environmentObject(cart)
                        })
                        CartIcon()
                    }
                )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(productViewModel: ProductsViewModel(), presentSideMenu: .constant(true)).environmentObject(CartViewModel())
    }
}
