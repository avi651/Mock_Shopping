//
//  NavigationSlideIcon.swift
//  MockShopping
//
//  Created by Avinash Kumar on 11/08/23.
//

import SwiftUI

struct NavigationSlideIcon: View {
    var body: some View {
        Image(systemName:"line.horizontal.3")
            .foregroundColor(CustomColor.DarkText)
            .imageScale(.large)
    }
}

struct NavigationSlideIcon_Previews: PreviewProvider {
    static var previews: some View {
        NavigationSlideIcon()
    }
}
