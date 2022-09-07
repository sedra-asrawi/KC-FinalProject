//
//  Store_sApp.swift
//  Store.s
//
//  Created by Sedra Asrawi on 24/08/2022.
//


import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct Store_sApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate 
    
    var body: some Scene {
        let ViewModelSign = AppViewModel()
        WindowGroup {
            ContentView()
                .environmentObject(ViewModelSign)
        }
        
    }
}

//class AppDelegate : UIApplicationDelegate {
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//
//        FirebaseApp.configure()
//        return true
//    }
//}
