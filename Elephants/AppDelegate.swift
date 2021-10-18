//
//  AppDelegate.swift
//  Elephants
//
//  Created by Rayana Prata Neves on 18/10/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window?.frame = UIScreen.main.bounds
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

}

