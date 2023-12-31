//
//  ProfileIcon.swift
//  MockShopping
//
//  Created by Avinash Kumar on 10/08/23.
//

import SwiftUI

struct ProfileIcon: View {
    var body: some View {
        Image(systemName:"person")
            .foregroundColor(CustomColor.DarkText)
            .imageScale(.large)
    }
}

struct ProfileIcon_Previews: PreviewProvider {
    static var previews: some View {
        ProfileIcon()
    }
}
