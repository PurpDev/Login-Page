//
//  Login_pageApp.swift
//  Login page
//
//  Created by Augustin Diabira on 29/10/2021.
//

import SwiftUI
import Firebase

@main
struct Login_pageApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate 
    var body: some Scene {
        
        WindowGroup {
            let viewModel = AppViewModel()
           SignIn()
                .environmentObject(viewModel)
           
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        return true
    }
}
