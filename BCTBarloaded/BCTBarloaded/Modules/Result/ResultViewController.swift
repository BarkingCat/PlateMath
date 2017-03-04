//
//  ResultViewController.swift
//  BCTBarloaded
//
//  Created by Rakesh B SablePatil on 13/05/16.
//  Copyright © 2016 CSNS. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var plateNames: NSMutableArray!;
    var weightArray: NSMutableArray!;
    
    @IBOutlet var resultTable: UITableView!
    @IBOutlet var targetWeightLbl: UILabel!
    @IBOutlet var platesParentView: UIView!
    @IBOutlet var platesCenterView: UIView!
    
    var totalWeight: Float!;
    var barWeight: Float!;
    var collarWeight: Float!;
    var subTotal: Float!;
    var plateImgArr: NSMutableDictionary!;
    var resultWeightArr: NSMutableArray!;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.setupNavigationController();
        
        // Set Array
        self.plateNames = [ "25 Kg x 4", "5 Kg x 2", "2.5 Kg x 2", "Sub Total", "Remaining" ];
        self.weightArray = [ "100", "10", "5", "115", "0"];
        self.plateImgArr = NSMutableDictionary();
        self.resultWeightArr = NSMutableArray();
        
        // Register custom cell
        let nib = UINib(nibName: "ResultCellTableViewCell", bundle: nil)
        resultTable.registerNib(nib, forCellReuseIdentifier: "reuse")
        
        if resultTable.respondsToSelector("setSeparatorInset:") {
            resultTable.separatorInset = UIEdgeInsetsZero
        }
        if resultTable.respondsToSelector("setLayoutMargins:") {
            resultTable.layoutMargins = UIEdgeInsetsZero
        }
        
        // Set default view
        resultTable.layoutIfNeeded()
        resultTable.tableFooterView = UIView()
        
        // Set default values
        if( self.totalWeight == nil ) {
            self.totalWeight = 0.0;
        }
        
        if( self.barWeight == nil ) {
            self.barWeight = 0.0;
        }
        
        if( self.collarWeight == nil ) {
            self.collarWeight = 0.0;
        }
        
        if( self.subTotal == nil ) {
            self.subTotal = 0.0;
        }
        
        // Calculate Sub Total
        self.subTotal = self.totalWeight - self.barWeight - self.collarWeight;
        
        // Calculate weight
        self.calculateWeight();
        
        // Set values
        self.targetWeightLbl.text = "\(self.totalWeight)";
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
        self.title = "Result";
        
        // Set background color and foreground color to navigation bar
        self.navigationController!.navigationBar.barTintColor = UIColor.darkGrayColor();
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor();
        
        let backImage = UIImage(named: "back") as UIImage!;
        
        let rvVC = self.revealViewController();
        if(( rvVC ) != nil) {
            self.navigationItem.leftBarButtonItem =  UIBarButtonItem(image: backImage, style: UIBarButtonItemStyle.Plain, target: self, action: Selector("homeAction"))
            
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            //self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
    }
    
    // MARK: - Common Methods
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }
    
    func homeAction() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    // MARK: - Calculate Weight
    func calculateWeight() {
        print( "\(self.totalWeight) --- \(self.barWeight) --- \(self.collarWeight)" );
        
        // Calculate Sub Total
        //self.subTotal = self.totalWeight - self.barWeight;
        
        let avaWeights: [Float] = [25.0, 20.0, 15.0, 10.0, 5.0, 2.5, 1.25, 0.5, 0.25];
        
        self.plateNames = [];
        self.weightArray = [];
        
        var subTot = self.subTotal;
        
        var subTotInt: Int;
        var grandSubTot: Float = 0.0;
        
        subTotInt = 0;
        
        var avaWeightSettings: Int;
        
        avaWeightSettings = 0;
        
        var xyz: Float!;
        xyz = 0.0;
        
        for index in 0...(avaWeights.count-1) {
            print("\(avaWeights[index]) --> \(subTot)");
            
            subTotInt = Int( subTot / avaWeights[index] );
            
            if( subTotInt == 0 || subTotInt == 1 ) {
                continue;
            }
            
            avaWeightSettings = appDelegate.defaultsData.valueForKey("\(avaWeights[index])") as! Int;
            
            xyz = self.subTotal - grandSubTot;
            
            if( xyz < 0.5 ) {
                break;
            }
            
            if( avaWeightSettings >= 2 ) {
                if( avaWeightSettings < subTotInt ) {
                    subTotInt = avaWeightSettings;
                }
                
                if( subTotInt % 2 == 0 ) {
                    
                    self.plateNames.addObject(  "\(avaWeights[index]) Kg X \(subTotInt)");
                    self.weightArray.addObject( String(format: "%.2f", (avaWeights[index] * Float(subTotInt))));
                    self.plateImgArr.setValue(subTotInt, forKey: "\(avaWeights[index])")
                    self.resultWeightArr.addObject("\(avaWeights[index])")
                    subTot = subTot - ( avaWeights[index] * Float(subTotInt) );
                    grandSubTot += ( avaWeights[index] * Float(subTotInt) );
                    
                } else if( subTotInt - 1 > 1 ) {
                    self.plateNames.addObject("\(avaWeights[index]) Kg X \(subTotInt-1)");
                    self.weightArray.addObject( String(format: "%.2f", (avaWeights[index] * Float(subTotInt-1))));
                    self.plateImgArr.setValue((subTotInt-1), forKey: "\(avaWeights[index])")
                    self.resultWeightArr.addObject("\(avaWeights[index])")
                    subTot = subTot - ( avaWeights[index] * Float(subTotInt-1) );
                    grandSubTot += ( avaWeights[index] * Float(subTotInt-1) );
                }
            }
        }
        
        self.plateNames.addObject("Sub Total");
        self.plateNames.addObject("Bar Weight");
        self.plateNames.addObject("Collar Weight");
        self.plateNames.addObject("Remaining");
        
        self.weightArray.addObject( String(format: "%.2f", (grandSubTot)));
        self.weightArray.addObject( String(format: "%.2f", (self.barWeight)));
        self.weightArray.addObject( String(format: "%.2f", (self.collarWeight)));
        self.weightArray.addObject( String(format: "%.2f", (self.subTotal - grandSubTot)));
        
        
        self.resultTable.reloadData();
        
        self.setPlatesView(self.plateImgArr, weightLclArr: self.resultWeightArr)
    }
    
    func setPlatesView(platesArr: NSDictionary, weightLclArr: NSArray) {
        print(platesArr);
        print(weightLclArr);
        
        var viewIndex = 0;
        var tempImgView = UIImageView();
        let tempParentView = UIView();
        
        if( weightLclArr.count >= 1 ) {
            for index in 0...(weightLclArr.count-1) {
                let it = (platesArr.valueForKey(weightLclArr[index] as! String) as! Int) / 2;
                
                for itIndex in 0...(it-1) {
                    
                    tempImgView = PlateImagesHelper.getWeightPlateImgView(Float(weightLclArr[index] as! String)!);
                    
                    tempImgView.frame = CGRectMake(CGFloat(((viewIndex * 21) + 25)), 25.0, 23.0, 100.0);
                    tempParentView.addSubview(tempImgView);
                    viewIndex++;
                }
            }
            
            let tempParentViewWidth = CGFloat(viewIndex * 21);
            let xIndex = (( self.platesParentView.bounds.width - tempParentViewWidth) / 2 );
            
            tempParentView.frame = CGRectMake(xIndex-25, 0.0, tempParentViewWidth, 100.0);
            
            self.platesParentView.addSubview( tempParentView );
        }
        
        
        
    }
    
    
    // MARK: - Table view delegates
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weightArray.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ResultCellTableViewCell = tableView.dequeueReusableCellWithIdentifier("reuse") as! ResultCellTableViewCell
        
        // Configure the cell...
        
        cell.leftLabel.text = self.plateNames[indexPath.row] as? String
        cell.rightLabel.text = self.weightArray[indexPath.row] as? String
        
        if cell.respondsToSelector("setSeparatorInset:") {
            cell.separatorInset = UIEdgeInsetsZero
        }
        if cell.respondsToSelector("setLayoutMargins:") {
            cell.layoutMargins = UIEdgeInsetsZero
        }
        cell.selectionStyle = UITableViewCellSelectionStyle.None;
        cell.contentView.backgroundColor = UIColor.clearColor();
        
        return cell
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
