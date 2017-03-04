//
//  SettingsViewController.swift
//  BCTBarloaded
//
//  Created by Rakesh B SablePatil on 14/05/16.
//  Copyright © 2016 CSNS. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var kg25Txt: UITextField!
    @IBOutlet var kg20Txt: UITextField!
    @IBOutlet var kg15Txt: UITextField!
    @IBOutlet var kg10Txt: UITextField!
    @IBOutlet var kg5Txt: UITextField!
    @IBOutlet var kg2_5Txt: UITextField!
    @IBOutlet var kg1_25Txt: UITextField!
    @IBOutlet var kg0_5Txt: UITextField!
    @IBOutlet var kg0_25Txt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationController();
        
        // Set data to text fields
        if( appDelegate.defaultsData.valueForKey("25.0") != nil ) {
            self.kg25Txt.text = "\(appDelegate.defaultsData.valueForKey("25.0")!)";
        }
        
        if( appDelegate.defaultsData.valueForKey("20.0") != nil ) {
            self.kg20Txt.text = "\(appDelegate.defaultsData.valueForKey("20.0")!)";
        }
        
        if( appDelegate.defaultsData.valueForKey("15.0") != nil ) {
            self.kg15Txt.text = "\(appDelegate.defaultsData.valueForKey("15.0")!)";
        }
        
        if( appDelegate.defaultsData.valueForKey("10.0") != nil ) {
            self.kg10Txt.text = "\(appDelegate.defaultsData.valueForKey("10.0")!)";
        }
        
        if( appDelegate.defaultsData.valueForKey("5.0") != nil ) {
            self.kg5Txt.text = "\(appDelegate.defaultsData.valueForKey("5.0")!)";
        }
        
        if( appDelegate.defaultsData.valueForKey("2.5") != nil ) {
            self.kg2_5Txt.text = "\(appDelegate.defaultsData.valueForKey("2.5")!)";
        }
        
        if( appDelegate.defaultsData.valueForKey("1.25") != nil ) {
            self.kg1_25Txt.text = "\(appDelegate.defaultsData.valueForKey("1.25")!)";
        }
        
        if( appDelegate.defaultsData.valueForKey("0.5") != nil ) {
            self.kg0_5Txt.text = "\(appDelegate.defaultsData.valueForKey("0.5")!)";
        }
        
        if( appDelegate.defaultsData.valueForKey("0.25") != nil ) {
            self.kg0_25Txt.text = "\(appDelegate.defaultsData.valueForKey("0.25")!)";
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // Setup navigation controller
    func setupNavigationController() {
        self.title = "Settings";
        
        // Set background color and foreground color to navigation bar
        self.navigationController!.navigationBar.barTintColor = UIColor.darkGrayColor();
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor();
        
        let backImage = UIImage(named: "ic_menu") as UIImage!;
        
        let rvVC = self.revealViewController();
        if(( rvVC ) != nil) {
            self.navigationItem.leftBarButtonItem =  UIBarButtonItem(image: backImage, style: UIBarButtonItemStyle.Plain, target: self.revealViewController(), action: Selector("revealToggle:"))
            
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }
    
    func homeAction() {
        self.navigationController?.popViewControllerAnimated(false)
    }
    
    @IBAction func savePlates(sender: AnyObject) {
        
        //let platesArr: [Float:Float] = [25.0: Float(self.kg25Txt.text!)!, 20.0: Float(self.kg20Txt.text!)! ];
        
        appDelegate.defaultsData.setFloat(Float(self.kg25Txt.text!)!, forKey: "25.0");
        appDelegate.defaultsData.setFloat(Float(self.kg20Txt.text!)!, forKey: "20.0");
        appDelegate.defaultsData.setFloat(Float(self.kg15Txt.text!)!, forKey: "15.0");
        appDelegate.defaultsData.setFloat(Float(self.kg10Txt.text!)!, forKey: "10.0");
        appDelegate.defaultsData.setFloat(Float(self.kg5Txt.text!)!, forKey: "5.0");
        appDelegate.defaultsData.setFloat(Float(self.kg2_5Txt.text!)!, forKey: "2.5");
        appDelegate.defaultsData.setFloat(Float(self.kg1_25Txt.text!)!, forKey: "1.25");
        appDelegate.defaultsData.setFloat(Float(self.kg0_5Txt.text!)!, forKey: "0.5");
        appDelegate.defaultsData.setFloat(Float(self.kg0_25Txt.text!)!, forKey: "0.25");
        appDelegate.defaultsData.synchronize();
        
        Utility.ShowAlertWithTitleAndMessage("BCTBarloaded", message: "Settings saved successfully");
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
