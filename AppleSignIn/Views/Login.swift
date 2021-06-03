//
//  Login.swift
//  AppleSignIn
//
//  Created by Darrien Huntley on 6/3/21.
//

import SwiftUI
import AuthenticationServices


struct Login: View {
    
    @StateObject var loginVM = LoginViewModel()
    
    
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
                .overlay(Color.black.opacity(0.35))
                .ignoresSafeArea()
            
            VStack(spacing: 25) {
                
                Text("Welcome")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
               
                Spacer()
                
                
                VStack(alignment: .leading , spacing: 30) {
                    Text("Most Popular\n Clothing line")
                        .font(.system(size: 45))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("Internationaly known and powered by darrien huntley")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 30)
                
                
                Spacer()
                
                // Login Button...
                
                SignInWithAppleButton { request in
                    
                    // requesting parameters from app login...
                    
                    // remove private from func in loginVM
                    loginVM.nonce = randomNonceString()
                    request.requestedScopes = [.email , .fullName]
                    request.nonce = sha256(loginVM.nonce)
                    
                    
                    
                    
                } onCompletion: { result in
                    // getting error or success..
                    
                    switch result{
                    
                    case .success(let user) :
                        print("success")
                        // do login with firebase....
                        guard let credential = user.credential as? ASAuthorizationAppleIDCredential else {
                            print("DEBUG: Error with firebase")
                            return
                        }
                        loginVM.authenticate(credential: credential)
                    
                    case.failure(let error):
                        print(error.localizedDescription)
                    }
                }
                .signInWithAppleButtonStyle(.white)
                .frame(height: 55)
                .clipShape(Capsule())
                .padding(.horizontal , 40)
                .offset(y : -70)

            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
