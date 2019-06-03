//
//  AppDelegate.swift
//  SampleApp
//
//  Created by Nanda Julianda Akbar on 31/05/19.
//  Copyright © 2019 Nanda Julianda Akbar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		window = UIWindow()
		window?.rootViewController = UINavigationController(rootViewController: MainViewController())
		window?.makeKeyAndVisible()
		
		return true
	}

}
