//
//  ProfileView.swift
//  MockShopping
//
//  Created by Avinash Kumar on 10/08/23.
//

import SwiftUI

struct ProfileView: View {
    
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        NavigationView{
            ZStack{
                Text("Hello Wo")
            }.navigationBarTitleDisplayMode(.large)
                .navigationBarItems(
                    leading:HStack{
                        Button(action: {
                            presentSideMenu.toggle()
                        }, label: {
                            ZStack{
                                Circle()
                                    .fill(CustomColor.AssentColor)
                                    .frame(width: 40, height: 40)
                                    .overlay(Image(systemName: "cart")
                                        .foregroundColor(CustomColor.SecondaryBackground)
                                        .imageScale(.large))  .overlay(Circle().stroke(lineWidth: 2).foregroundColor(CustomColor.SecondaryBackground))
                            }
                        })
                        ProfileIcon()
                    },
                    trailing:ProfileIcon()
                )
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(presentSideMenu: .constant(true))
    }
}
