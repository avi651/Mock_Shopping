//
//  ContentView.swift
//  MockShopping
//
//  Created by Avinash Kumar on 02/08/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var productViewModel = ProductsViewModel()
    
    @Environment(\.colorScheme) var colorScheme
    @StateObject var cartItems = CartViewModel()
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedSideMenuTab) {
                HomeView(productViewModel: productViewModel, presentSideMenu: $presentSideMenu).environmentObject(cartItems)
                    .tag(0)
                CartView(presentSideMenu: $presentSideMenu)
                    .tag(1)
                ProfileView(presentSideMenu: $presentSideMenu)
                    .tag(2)
            }
            SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
