//
//  CalculatorViewController.swift
//  BCTBarloaded
//
//  Created by Rakesh B SablePatil on 12/05/16.
//  Copyright © 2016 CSNS. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet var barWeightsToolBar: UIToolbar!
    @IBOutlet var barWeightsPickerView: UIPickerView!
    
    var barWeightsArr: NSArray!
    var barWeightsValArr: NSArray!
    var collarWeightsArr: NSArray!
    var collarWeightsValArr: NSArray!
    var selectedPicker: String!
    
    var selectedBarWeight: String!
    var selectedCollarWeight: String!

    @IBOutlet var barWeightTxt: UITextField!
    @IBOutlet var collarWeightTxt: UITextField!
    @IBOutlet var totalWeightTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Get all bar weight values
        self.barWeightsValArr = BarWeightsHelper.getAllBarWeightsValues();
        self.barWeightsArr = BarWeightsHelper.getAllBarWeights();
        
        // Get all collar weight values
        self.collarWeightsValArr = CollarWeightsHelper.getAllCollarWeightsValues();
        self.collarWeightsArr = CollarWeightsHelper.getAllCollarWeights();
        
        // Set default value
        self.selectedPicker = "";
        
        // Hide institute view at the beginning
        self.barWeightsPickerView.hidden = true;
        self.barWeightsToolBar.hidden = true;
        
        self.collarWeightTxt.inputView = UIView();
        self.barWeightTxt.inputView = UIView();
        
        self.setupNavigationController();
        
        self.totalWeightTxt.keyboardType = UIKeyboardType.DecimalPad
        
        self.addDoneButtonOnKeyboard();
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
        self.title = "Calculator";
        
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
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func openDisclaimer() {
        self.navigationController?.pushViewController(DisclaimerViewController(nibName: "DisclaimerViewController", bundle: nil), animated: false)
    }
    
    @IBAction func getResult(sender: AnyObject) {
        
        let totWeight = Float( self.totalWeightTxt.text! );
        let barWeight = Float( self.barWeightTxt.text! );
        let collarWeight = Float( self.collarWeightTxt.text! );
        
        if( totWeight < 0.5 || totWeight > 500 ) {
            Utility.ShowAlertWithTitleAndMessage("BCTBarloaded", message: "Please enter valid total weight (Range is 0.5-500)");
            return;
        } else if ( !(totWeight! % 0.5 == 0) ) {
            Utility.ShowAlertWithTitleAndMessage("BCTBarloaded", message: "Please enter total weight in multiple of 0.5");
            return;
        } else if ( barWeight < 11.0 ) {
            Utility.ShowAlertWithTitleAndMessage("BCTBarloaded", message: "Please select bar weight.");
            return;
        }
        
        let resultVC = ResultViewController(nibName: "ResultViewController", bundle: nil);
        resultVC.totalWeight = totWeight;
        resultVC.barWeight = barWeight;
        resultVC.collarWeight = collarWeight;
        
        self.navigationController?.pushViewController(resultVC, animated: true)
    }
    
    @IBAction func reset(sender: AnyObject) {
        self.collarWeightTxt.text = "";
        self.barWeightTxt.text = "";
        self.totalWeightTxt.text = "";
    }
    
    @IBAction func touchupTxt(sender: AnyObject) {
        self.barWeightsToolBar.hidden = true;
        self.barWeightsPickerView.hidden = true;
    }
    
    // MARK: - Pickerview custom actions.
    
    @IBAction func selectBarWeightAction(sender: AnyObject) {
        self.barWeightsArr = BarWeightsHelper.getAllBarWeights();
        self.barWeightsValArr = BarWeightsHelper.getAllBarWeightsValues();
        self.barWeightsPickerView.reloadAllComponents();
        self.barWeightsToolBar.hidden = false;
        self.barWeightsPickerView.hidden = false;
        self.totalWeightTxt.resignFirstResponder();
        self.selectedPicker = "BarWeight";
        self.barWeightTxt.text = "";
    }
    
    @IBAction func selectCollarWeightAction(sender: AnyObject) {
        self.barWeightsArr = CollarWeightsHelper.getAllCollarWeights();
        self.barWeightsValArr = CollarWeightsHelper.getAllCollarWeightsValues();
        self.barWeightsPickerView.reloadAllComponents();
        self.barWeightsToolBar.hidden = false;
        self.barWeightsPickerView.hidden = false;
        self.totalWeightTxt.resignFirstResponder();
        self.selectedPicker = "CollarWeight";
        self.collarWeightTxt.text = "";
    }
    
    @IBAction func doneAction(sender: AnyObject) {
        //self.cityBtn.titleLabel?.text = self.selectedCity;
        
        switch( self.selectedPicker ) {
        case "BarWeight":
            //self.cityBtn.titleLabel?.text = self.selectedCity;
            self.barWeightTxt.text = self.selectedBarWeight;
            break;
        case "CollarWeight":
            //self.cityBtn.titleLabel?.text = self.selectedCity;
            self.collarWeightTxt.text = self.selectedCollarWeight;
            break;
        default: break;
        }
        
        self.barWeightsPickerView.hidden = true;
        self.barWeightsToolBar.hidden = true;
    }
    
    @IBAction func cancelAction(sender: AnyObject) {
        self.barWeightsPickerView.hidden = true;
        self.barWeightsToolBar.hidden = true;
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.barWeightsPickerView.hidden = true;
        self.barWeightsToolBar.hidden = true;
    }
    
    @IBAction func clearTextField(sender: AnyObject) {
        self.totalWeightTxt.text = "";
    }
    
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRectMake(0, 0, 320, 50))
        //doneToolbar.barStyle = UIBarStyle.BlackTranslucent
        
        let cancel: UIBarButtonItem = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("doneButtonAction"))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: Selector("doneButtonAction"))
        
        doneToolbar.items = [ cancel, flexSpace, done ];
        
        doneToolbar.sizeToFit();
        
        self.totalWeightTxt.inputAccessoryView = doneToolbar
        
    }
    
    func doneButtonAction()
    {
        self.totalWeightTxt.resignFirstResponder()
    }
    
    
    // MARK: - Pickerview delegates
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.barWeightsArr.count;
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //return "Item \(row)";
        return (self.barWeightsArr[row] as! String);
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch( self.selectedPicker ) {
        case "BarWeight":
            self.selectedBarWeight = "\(self.barWeightsValArr[row])";
            break;
        case "CollarWeight":
            self.selectedCollarWeight = "\(self.barWeightsValArr[row])";
            break;
        default: break;
        }
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
