//
//  CustomTextField.swift
//  MVVM_SwiftUI
//
//  Created by kumersan on 10/24/24.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var value: String
    var placeholder: String
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.clear)
                .frame(height: 55)
                .overlay(
                    Rectangle()
                        .fill(Color(red: 84/225, green: 84/225, blue: 86/225,opacity: 0.3))
                        .frame(height: 1)
                        .frame(maxHeight: 44, alignment: .bottom),
                    alignment: .bottom
                )
            HStack(alignment: .center, spacing: 0, content: {
                Text(placeholder)
                    .padding()
                    .setCustomFont(fontType: .textField)
                    .frame(width: 120)
                TextField(placeholder, text: $value)
                    .padding([.trailing], 20)
                    .frame(height: 44)
                    .background(Color.clear)
                    .setCustomFont(fontType: .textField)
            })
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        // Declare @State inside the preview closure
        @State var value = "example@gmail.com"
        @State var placeholder = "email"
        CustomTextField(value: $value, placeholder: placeholder)
    }
}
