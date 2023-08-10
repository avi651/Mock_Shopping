//
//  SlideMenuView.swift
//  MockShopping
//
//  Created by Avinash Kumar on 10/08/23.
//

import SwiftUI

enum SideMenuRowType: Int, CaseIterable{
    case home = 0
    case cart
    case profile
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .cart:
            return "Cart"
        case .profile:
            return "Profile"
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "home"
        case .cart:
            return "Cart"
        case .profile:
            return "profile"
        }
    }
}

struct SideMenuView: View {
    
    @Binding var selectedSideMenuTab: Int
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        HStack {
            
            ZStack{
                Rectangle()
                    .fill(.white)
                    .frame(width: 270)
                    .shadow(color: .purple.opacity(0.1), radius: 5, x: 0, y: 3)
                
                VStack(alignment: .leading, spacing: 0) {
                    ProfileImageView()
                        .frame(height: 140)
                        .padding(.bottom, 30)
                    
                    ForEach(SideMenuRowType.allCases, id: \.self){ row in
                        RowView(isSelected: selectedSideMenuTab == row.rawValue, imageName: row.iconName, title: row.title) {
                            selectedSideMenuTab = row.rawValue
                            presentSideMenu.toggle()
                        }
                    }
                    
                    Spacer()
                }
                .padding(.top, 100)
                .frame(width: 270)
                .background(
                    CustomColor.Tertiary
                )
            }
            
            
            Spacer()
        }
        .background(.clear)
    }
    
    func ProfileImageView() -> some View{
        VStack(alignment: .center){
            HStack{
                Spacer()
                Image("profile-image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(.purple.opacity(0.5), lineWidth: 10)
                    )
                    .cornerRadius(50)
                Spacer()
            }
            
            Text("Avinash K")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(CustomColor.DarkText)
            
            Text("IOS Developer/Flutter Developer")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(CustomColor.DarkText)
        }
    }
    
    func RowView(isSelected: Bool, imageName: String, title: String, hideDivider: Bool = false, action: @escaping (()->())) -> some View{
        Button{
            action()
        } label: {
            VStack(alignment: .leading){
                HStack(spacing: 20){
                    Rectangle().fill(isSelected ? CustomColor.DarkText : CustomColor.SecondaryBackground)
                        .frame(width: 5)
                    
                    ZStack{
                        Image(imageName)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(isSelected ? CustomColor.DarkText : CustomColor.SecondaryBackground)
                            .frame(width: 26, height: 26)
                    }
                    .frame(width: 30, height: 30)
                    Text(title)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(isSelected ? CustomColor.DarkText : CustomColor.SecondaryBackground)
                    Spacer()
                }
            }
        }
        .frame(height: 50)
        .background(
           isSelected ? CustomColor.AssentColor : CustomColor.Tertiary
        )
    }
}


