//
//  AppDelegate.swift
//  SpallaExample
//
//  Created by Rogerio Shimizu on 6/16/25.
//


import Foundation
import UIKit
import SpallaSDK


class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        Spalla.shared.initialize(token: "Your Spalla Token", applicationId: nil)
        return true
    }

    
}
