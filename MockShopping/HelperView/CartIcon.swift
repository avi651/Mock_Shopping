//
//  CartIcon.swift
//  MockShopping
//
//  Created by Avinash Kumar on 11/08/23.
//

import SwiftUI

struct CartIcon: View {
    var body: some View {
        Image(systemName:"cart")
            .foregroundColor(CustomColor.DarkText)
            .imageScale(.large)
    }
}

struct CartIcon_Previews: PreviewProvider {
    static var previews: some View {
        CartIcon()
    }
}
