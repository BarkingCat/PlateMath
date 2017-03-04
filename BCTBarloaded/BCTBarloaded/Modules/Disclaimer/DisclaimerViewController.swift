//
//  DisclaimerViewController.swift
//  BCTBarloaded
//
//  Created by Rakesh B SablePatil on 12/05/16.
//  Copyright © 2016 CSNS. All rights reserved.
//

import UIKit

class DisclaimerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupNavigationController();
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
        self.title = "About Us";
        
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
    
    func openDisclaimer() {
        self.navigationController?.pushViewController(DisclaimerViewController(nibName: "DisclaimerViewController", bundle: nil), animated: false)
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
