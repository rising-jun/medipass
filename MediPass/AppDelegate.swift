//
//  AppDelegate.swift
//  MediPass
//
//  Created by 김동준 on 2021/04/14.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window  : UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let nav = UINavigationController()
        window?.rootViewController = nav
        
        let tabBarController = UITabBarController()
        nav.pushViewController(tabBarController, animated: true)
        
        nav.modalPresentationStyle = .fullScreen
        
        let homeVC = HomeVC()
        tabBarController.addChild(homeVC)
        homeVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(), tag: 0)
        
        let historyPagerVC = HistoryPagerVC()
        tabBarController.addChild(historyPagerVC)
        historyPagerVC.tabBarItem = UITabBarItem(title: "내역", image: UIImage(), tag: 1)
        
        let myVC = MyVC()
        tabBarController.addChild(myVC)
        myVC.tabBarItem = UITabBarItem(title: "내정보", image: UIImage(), tag: 1)
        tabBarController.tabBar.backgroundColor = .white
        
        return true
    }



}

