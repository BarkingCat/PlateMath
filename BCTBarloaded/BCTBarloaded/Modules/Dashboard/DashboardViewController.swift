//
//  DashboardViewController.swift
//  BCTBarloaded
//
//  Created by Rakesh B SablePatil on 29/04/16.
//  Copyright © 2016 CSNS. All rights reserved.
//

import UIKit
import MessageUI

class DashboardViewController: UIViewController {
    
    @IBOutlet var mainScrollView: TPKeyboardAvoidingScrollView!
    
    @IBOutlet var plate25Lbl: UILabel!
    @IBOutlet var plate20Lbl: UILabel!
    @IBOutlet var plate15Lbl: UILabel!
    @IBOutlet var plate10Lbl: UILabel!
    @IBOutlet var plate5Lbl: UILabel!
    @IBOutlet var plate2_5Lbl: UILabel!
    @IBOutlet var plate1_25Lbl: UILabel!
    @IBOutlet var plate0_5Lbl: UILabel!
    @IBOutlet var plate0_25Lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.setupNavigationController();
        
        self.mainScrollView.contentSizeToFit();
        
        self.setPlatesAvailableData();
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
        self.title = "Available Plates";
        
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
    
    func setPlatesAvailableData() {
        self.plate25Lbl.text = "\(appDelegate.defaultsData.integerForKey("25.0"))";
        self.plate20Lbl.text = "\(appDelegate.defaultsData.integerForKey("20.0"))";
        self.plate15Lbl.text = "\(appDelegate.defaultsData.integerForKey("15.0"))";
        self.plate10Lbl.text = "\(appDelegate.defaultsData.integerForKey("10.0"))";
        self.plate5Lbl.text = "\(appDelegate.defaultsData.integerForKey("5.0"))";
        self.plate2_5Lbl.text = "\(appDelegate.defaultsData.integerForKey("2.5"))";
        self.plate1_25Lbl.text = "\(appDelegate.defaultsData.integerForKey("1.25"))";
        self.plate0_5Lbl.text = "\(appDelegate.defaultsData.integerForKey("0.5"))";
        self.plate0_25Lbl.text = "\(appDelegate.defaultsData.integerForKey("0.25"))";
    }
    
    func homeAction() {
        
    }

    @IBAction func moveToNext(sender: AnyObject) {
        self.navigationController?.pushViewController(CalculatorViewController( nibName: "CalculatorViewController", bundle: nil), animated: true);
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

let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;