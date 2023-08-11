//
//  CustomPicker.swift
//  MockShopping
//
//  Created by Avinash Kumar on 11/08/23.
//

import SwiftUI

struct CustomPicker: View {
    
    @Binding var choosenCategory: ProductListEndpoint
    
    var body: some View {
        HStack(spacing: 16) {
            Picker("", selection: $choosenCategory, content: {
                ForEach(ProductListEndpoint.allCases, id: \.self) { option in
                    Text(option.rawValue)
                }
            })
            .pickerStyle(SegmentedPickerStyle()).padding()
        }
    }
}

struct CustomPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomPicker(choosenCategory: .constant(.all))
    }
}
