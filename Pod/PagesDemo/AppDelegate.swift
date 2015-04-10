//
//  AppDelegate.swift
//  PagesDemo
//
//  Created by Christoffer Winterkvist on 4/10/15.
//  Copyright (c) 2015 Hyper. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

      let viewController1 = UIViewController()
      viewController1.view.backgroundColor = UIColor.lightGrayColor()
      viewController1.title = "Controller A"

      let viewController2 = UIViewController()
      viewController2.view.backgroundColor = UIColor.whiteColor()
      viewController2.title = "Controller B"

      let pages = Pages()
      pages.addPage(viewController1)
      pages.addPage(viewController2)
      pages.enableSwipe = false

      let navigationController = UINavigationController(rootViewController: pages)

      pages.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Previous Page", style: .Plain, target: pages, action: "previousPage")

      pages.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next Page", style: .Plain, target: pages, action: "nextPage")

      self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
      self.window?.rootViewController = navigationController
      self.window?.makeKeyAndVisible()

        return true
    }
}

