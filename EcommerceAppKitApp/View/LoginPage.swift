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
            
            TextField(hint, text: value)
            
            Divider()
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
          //  .previewDevice("iPhone 8")
    }
}
