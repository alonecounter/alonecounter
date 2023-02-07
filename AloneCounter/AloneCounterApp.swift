//
//  AloneCounterApp.swift
//  AloneCounter
//
//  Created by Ba Kien on 22/11/2022.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct AloneCounterApp: App {
    /**
     Google account  test
     ID : firebase.alonecounter@gmail.com
     PW: Abc13579*
     */
    // connecting App Delegate...
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @AppStorage("login_status") var login_status = false
    
    var body: some Scene {
        WindowGroup {
            if login_status {
                MainContent()
            }
            else{
                LogInView()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // init firebase
        FirebaseApp.configure()
        return true
    }
    
    
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any])
    -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
    
}
