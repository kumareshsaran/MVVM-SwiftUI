//
//  LoginView.swift
//  MVVM_SwiftUI
//
//  Created by kumersan on 10/24/24.
//

import SwiftUI

struct LoginView: View {
    @State var email = String()
    @State var password = String()
    @State var isLoggedIn = Bool()
    private var viewModel = LoginViewModel()
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image("cg-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.1)
                        .padding(.horizontal, geometry.size.width > 600 ? 40 : 20)
                    VStack(alignment: .center, spacing: 20) {
                        Text("Let's Begin")
                            .setCustomFont(fontType: .largeHeading)
                            .font(.system(size: geometry.size.width > 600 ? 40 : 24))
                        Text("Let's integrates seamlessly with your organization, ensuring all contacts are synced. It centralizes contact information for easy access.")
                            .multilineTextAlignment(.center)
                            .setCustomFont(fontType: .description)
                            .foregroundColor(.gray)
                            .font(.system(size: geometry.size.width > 600 ? 18 : 14))
                            .padding(.horizontal, geometry.size.width > 600 ? 50 : 20)
                    }
                    .padding(.bottom, 20)

                    VStack(spacing: 20) {
                        CustomTextField(value: $email, placeholder: "Email")
                            .frame(maxWidth: geometry.size.width > 600 ? 600 : .infinity)
                        CustomTextField(value: $password, placeholder: "Password")
                            .frame(maxWidth: geometry.size.width > 600 ? 600 : .infinity)
                    }
                    Spacer()
                    Button("Login") {
                        viewModel.login(email: email, password: password) {
                            print("Response Received")
                            isLoggedIn = true
                        }
                    }
                    .frame(maxWidth: geometry.size.width > 600 ? 600 : .infinity)
                    .padding(.vertical, 14)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, geometry.size.width > 600 ? 40 : 20)
                }
                .frame(width: geometry.size.width, height: geometry.size.height) // Ensures full-screen usage
            }
            .alert(isPresented: $isLoggedIn, content: {
                Alert(title: Text("Loggedin sucessfully"))
            })
        }
    }
}

#Preview {
    LoginView()
}
