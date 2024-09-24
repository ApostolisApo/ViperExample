//
//  AppDelegate.swift
//  FilmInfoViewer
//
//  Created by Apostolos Apostolidis on 2024-09-02.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow()
		let filmListController = FilmListRouter.viewController()
		let navigationController = UINavigationController(rootViewController: filmListController)
		window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
		return true
	}
}

