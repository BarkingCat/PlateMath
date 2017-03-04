//
//  Utility.swift
//  Credila
//

import UIKit
import Foundation


public class Utility {
    
    
    class func GetAppName() -> String {
        return "";
    }
    
    class func GetNoInternetMessage() -> String {
        return "The server is unreachable. Please check your internet connection.";
    }
    
    class func GetAlertWithTitleAndMessage(title: String, message: String) -> UIAlertView {
        
        let alert = UIAlertView(title: title, message: message, delegate: self, cancelButtonTitle: "OK");
        return alert;
    }
    
    
    
    class func ShowAlertWithTitleAndMessage(title: String, message: String) {
        
        let alert = UIAlertView(title: title, message: message, delegate: self, cancelButtonTitle: "OK");
        alert.show();
    }
    
    class func GetAlertWithTitleMessageButtonText(title: String, message: String, buttonText: String) -> UIAlertView {
        
        let alert = UIAlertView(title: title, message: message, delegate: self, cancelButtonTitle: buttonText);
        
        return alert;
    }
    
    
    class func SetUserData(data: NSDictionary) {
        appDelegate.defaultsData.setValuesForKeysWithDictionary(data as! [String : AnyObject]);
        appDelegate.defaultsData.synchronize();
    }
    
    class func GetUserId() -> Int {
        let userId = appDelegate.defaultsData.integerForKey("emp_id");
        
        return userId;
    }
    
    class func isValidEmail(testStr:String) -> Bool {
        // println("validate calendar: \(testStr)")
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
    
    class func loadDrawerScreen(pushFromViewController : UIViewController, pushToViewController : UIViewController){
        
        let pushNavigationController: UINavigationController = UINavigationController(rootViewController: pushToViewController)
        pushFromViewController.revealViewController().pushFrontViewController( pushNavigationController, animated: true)
        
    }
    
    class func setPrefData() {
        appDelegate.defaultsData.setFloat(14, forKey: "25.0");
        appDelegate.defaultsData.setFloat(2, forKey: "20.0");
        appDelegate.defaultsData.setFloat(2, forKey: "15.0");
        appDelegate.defaultsData.setFloat(2, forKey: "10.0");
        appDelegate.defaultsData.setFloat(2, forKey: "5.0");
        appDelegate.defaultsData.setFloat(2, forKey: "2.5");
        appDelegate.defaultsData.setFloat(2, forKey: "1.25");
        appDelegate.defaultsData.setFloat(2, forKey: "0.5");
        appDelegate.defaultsData.setFloat(2, forKey: "0.25");
        appDelegate.defaultsData.synchronize();
    }
    
    
}