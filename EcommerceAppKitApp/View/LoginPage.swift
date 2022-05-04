//
//  LoginPage.swift
//  EcommerceAppKitApp
//
//  Created by Tarik Adrien Villalobos on 05/06/2020.
//

import SwiftUI

struct LoginPage: View {
    @StateObject var loginData: LoginPageModel = LoginPageModel()
    var body: some View {
        
        VStack{
            
            // Welcome back text for 3 half of the screen...
            Text("Welcome\nback")
                .font(.system(size: 55)).bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .frame(height: getRect().height / 3.5)
                .padding()
            
            
            ScrollView(.vertical, showsIndicators: false) {
            
                VStack{
                    
                    Text("Login")
                        .font(.system(size: 22)).bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        
                    
                    CustomTextField(icon: "envelope", title: "Email", hint: "tarik@gmail.com", value: $loginData.email, showPassword: $loginData.showPassword)
                        .padding(.top,30)
                    
                    CustomTextField(icon: "lock", title: "Password", hint: "Senha@123", value: $loginData.password, showPassword: $loginData.showPassword)
                        .padding(.top,10)
                    
                    //Register Reenter Password
                    if loginData.registerUser{
                        CustomTextField(icon: "envelope", title: "Re-Enter Password", hint: "Senha@123", value: $loginData.re_Enter_Password, showPassword: $loginData.showReEnterPassword)
                            .padding(.top,10)
                    }
                    
                    // Forgot Password Button
                    Button {
                        loginData.ForgotPassword()
                    } label: {
                        
                        Text("Forgot password?")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.purple)
                    }
                    .padding(.top,8)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    // Login Button...
                    Button {
                        if loginData.registerUser{
                            loginData.Register()
                        }
                        else {
                            loginData.Login()
                            
                        }
                    } label: {
                        
                        Text("Login?")
                            .font(.system(size: 17)).bold()
                            .padding(.vertical,20)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(Color.purple)
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5)
                    }
                    .padding(.top,25)
                    .padding(.horizontal)
                    
                    // Register User Button...
                    
                    Button {
                        withAnimation{
                            loginData.registerUser.toggle()
                        }
                    } label: {
                        
                        Text("Create account?")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.purple)
                    }
                    .padding(.top,8)
                }.padding(30)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.white
                // Applying Custom Corners...
                    .clipShape(CustomCorners(corners: [.topLeft,.topRight], radius: 25))
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.purple))
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    func CustomTextField(icon: String,title: String,hint: String,value: Binding<String>, showPassword: Binding<Bool>)->some View{
        
        VStack(alignment: . leading, spacing: 12) {
            
            Label {
                Text(title)
                    .font(.system(size: 14))
            } icon: {
                Image(systemName: icon)
            }
            .foregroundColor(Color.black.opacity(0.8))
            
            if title.contains("Password") && !showPassword.wrappedValue{
                SecureField(hint, text: value)
                    .padding(.top,2)
            }
            else{
                TextField(hint, text: value)
                    .padding(.top,2)
            }
            
            Divider()
                .background(Color.black.opacity(0.4))
        }
        // Showing Show Button for password Field...
        .overlay(
            
            Group{
                
                if title.contains("Password"){
                    Button(action: {
                        showPassword.wrappedValue.toggle()
                    }, label: {
                        Text(showPassword.wrappedValue ? "Hide" : "Show")
                            .font(.system(size: 13)).bold()
                            .foregroundColor(Color.purple)
                    })
                    .offset(y: 8)
                }
            }
            
            ,alignment: .trailing
        )
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
          //  .previewDevice("iPhone 8")
    }
}
