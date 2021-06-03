//
//  Home.swift
//  AppleSignIn
//
//  Created by Darrien Huntley on 6/3/21.
//

import SwiftUI
import Firebase

struct Home: View {
    
    @AppStorage("log_status") var log_Status = false

    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 20) {
                Text("Apple Login Successful!")
                
                Button(action: {
                    // Logging Out User...
                    DispatchQueue.global(qos: .background).async {
                        try? Auth.auth().signOut()
                    }
                    
                    // Setting Back View to Login...
                    withAnimation(.easeInOut) {
                        log_Status = false
                    }
                
                }, label: {
                    Text("Log Out")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical , 12)
                        .frame(width: UIScreen.main.bounds.width / 2)
                        .background(Color.pink)
                        .clipShape(Capsule())
                })
            }
            .navigationTitle("Home")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
