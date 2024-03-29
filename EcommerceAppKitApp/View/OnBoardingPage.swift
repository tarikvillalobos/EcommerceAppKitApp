//
//  OnBoardingPage.swift
//  EcommerceAppKitApp
//
//  Created by Tarik Adrien Villalobos on 05/06/2020.
//

import SwiftUI

struct OnBoardingPage: View {
    // Showing Login Page...
    @State var showLoginPage: Bool = false
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text("Find your\nGadget")
                .font(.system(size: 55))
                .bold()
                .foregroundColor(.white)
                .padding(.top,30)
            
            Image("OnBoard2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 400, height: 400)
            
            Button {
                withAnimation{
                    showLoginPage = true
                }
            } label: {
                Text("Get started")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .padding(.vertical,18)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    .foregroundColor(Color.purple)
                    .cornerRadius(15)
            }
            .padding(.horizontal,30)
            .offset(y: getRect().height < 750 ? 20 : 40)
            
            Spacer()
        }.padding()
        .padding(.top,getRect().height < 750 ? 0 : 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.purple)
        .ignoresSafeArea(.all)
        .overlay(
        
            Group{
                if showLoginPage{
                    LoginPage()
                        .transition(.move(edge: .bottom))
                }
            }
        )
    }
}

struct OnBoardingPage_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPage()
            .previewDevice("iphone 11")
    }
}


extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
