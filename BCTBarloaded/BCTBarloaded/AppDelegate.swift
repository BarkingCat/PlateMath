//
//  AppDelegate.swift
//  BCTBarloaded
//
//  Created by Rakesh B SablePatil on 10/05/16.
//  Copyright © 2016 CSNS. All rights reserved.
//

import UIKit

extension NSUserDefaults {
    func hasKey(key: String) -> Bool {
        return objectForKey(key) != nil
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController!;
    var defaultsData: NSUserDefaults!;
    var device: String!;


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        sleep( 5 )
        
        self.defaultsData = NSUserDefaults.standardUserDefaults();
        
        let window: UIWindow! = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window = window
        
        let screenSize = UIScreen.mainScreen().bounds;
        print( screenSize )
        switch( screenSize.height ) {
        case 480: self.device = "iPhone4"; break;
        case 568: self.device = "iPhone5"; break;
        case 667: self.device = "iPhone6"; break;
        case 736: self.device = "iPhone6plus"; break;
        default: self.device = "iPhone4"; break;
        }
        
        //let pltwt = appDelegate.defaultsData.integerForKey("25.0");
        
        if( !appDelegate.defaultsData.hasKey("25.0") ) {
            Utility.setPrefData();
        }
        
        var viewController: UIViewController;
        
        let attributesDictionary = [NSForegroundColorAttributeName:UIColor.whiteColor(), NSFontAttributeName:UIFont(name: "HelveticaNeue-Bold", size: 17)!];
        UINavigationBar.appearance().titleTextAttributes = attributesDictionary;
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent;
        
        let frontViewController: CalculatorViewController = CalculatorViewController(nibName: "CalculatorViewController", bundle:  nil);
        let rearViewController: DrawerMenuTableViewController = DrawerMenuTableViewController(nibName: "DrawerMenuTableViewController", bundle: nil);
        
        //let rightViewController: RegistrationViewController = RegistrationViewController( nibName: "RegistrationViewController", bundle: nil);
        
        let frontNavigationController: UINavigationController = UINavigationController(rootViewController: frontViewController)
        let rearNavigationController: UINavigationController = UINavigationController(rootViewController: rearViewController)
        let revealController: SWRevealViewController = SWRevealViewController(rearViewController: rearNavigationController, frontViewController: frontNavigationController)
        //revealController.delegate = self
        //revealController.rightViewController = rightViewController
        viewController = revealController
        
        //frontNavigationController.navigationBar.barTintColor = UIColor(red: 1.0/255.0, green: 69.0/255.0, blue: 149.0/255.0, alpha: 1.0);
        frontNavigationController.navigationBar.barTintColor = UIColor.blackColor();
        //let frame = UIScreen.mainScreen().bounds
        
        frontNavigationController.navigationBar.barStyle = UIBarStyle.Black;
        frontNavigationController.navigationBar.tintColor = UIColor.whiteColor();
        
        rearNavigationController.navigationBar.barStyle = UIBarStyle.Black;
        rearNavigationController.navigationBar.tintColor = UIColor.whiteColor();
        
//        let attributesDictionary = [NSForegroundColorAttributeName:UIColor.whiteColor(), NSFontAttributeName:UIFont(name: "HelveticaNeue-Bold", size: 17)!];
//        UINavigationBar.appearance().titleTextAttributes = attributesDictionary;
//        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent;
        
        self.window!.rootViewController = viewController
        
        window?.makeKeyAndVisible();
        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

