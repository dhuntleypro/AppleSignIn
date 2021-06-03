//
//  AppleSignInApp.swift
//  AppleSignIn
//
//  Created by Darrien Huntley on 6/3/21.
//

// Setup
// 1. add signin with apple - under capibilities
// 2. firebase package - (firebase auth)
// 3.
    

import SwiftUI
import Firebase

@main
struct AppleSignInApp: App {
   
    // Calling Delegate...
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// Intializing Firebase...
class AppDelegate: NSObject, UIApplicationDelegate {
    // type appdidfin - then the second one
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}
