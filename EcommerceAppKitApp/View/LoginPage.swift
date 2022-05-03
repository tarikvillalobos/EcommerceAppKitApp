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
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
