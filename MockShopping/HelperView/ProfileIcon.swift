//
//  ProfileIcon.swift
//  MockShopping
//
//  Created by Avinash Kumar on 10/08/23.
//

import SwiftUI

struct ProfileIcon: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(CustomColor.AssentColor)
                .frame(width: 40, height: 40)
                .overlay(Image(systemName: "person")
                    .foregroundColor(CustomColor.SecondaryBackground)
                    .imageScale(.large))  .overlay(Circle().stroke(lineWidth: 2).foregroundColor(CustomColor.SecondaryBackground))
        }
    }
}

struct ProfileIcon_Previews: PreviewProvider {
    static var previews: some View {
        ProfileIcon()
    }
}
