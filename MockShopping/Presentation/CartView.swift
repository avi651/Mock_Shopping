//
//  CartView.swift
//  MockShopping
//
//  Created by Avinash Kumar on 10/08/23.
//

import SwiftUI

struct CartView: View {
    @Binding var presentSideMenu: Bool
    var body: some View {
        NavigationView{
            ZStack{
                Text("Hello Wo")
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
                            ProfileIcon()
                        })
                        CartIcon()
                    }
                )
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(presentSideMenu: .constant(true))
    }
}
