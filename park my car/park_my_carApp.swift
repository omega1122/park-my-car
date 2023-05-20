//
//  park_my_carApp.swift
//  park my car
//
//  Created by Ayan Rajpurohit on 22/11/22.
//

import SwiftUI
import UIKit
import FirebaseAuth
import FirebaseCore
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct park_my_carApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
           
               ContenttView()
            
        }
    }
}
