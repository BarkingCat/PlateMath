//
//  PlateImages.swift
//  BCTBarloaded
//
//  Created by Rakesh B SablePatil on 29/06/16.
//  Copyright © 2016 CSNS. All rights reserved.
//

import Foundation

public class PlateImagesHelper {
    
    class func getWeightPlateImgView( weight: Float ) -> UIImageView {
        var tempImgView = UIImageView();
        
        switch( weight ) {
            case 25.0: tempImgView = self.get25kgImgView(); break;
            case 20.0: tempImgView = self.get20kgImgView(); break;
            case 15.0: tempImgView = self.get15kgImgView(); break;
            case 10.0: tempImgView = self.get10kgImgView(); break;
            case 5.0 : tempImgView = self.get5kgImgView(); break;
            case 2.5 : tempImgView = self.get2_5kgImgView(); break;
            case 1.25: tempImgView = self.get1_25kgImgView(); break;
            case 0.5 : tempImgView = self.get0_5kgImgView(); break;
            case 0.25 : tempImgView = self.get0_25kgImgView(); break;
            
            default: break;
            
        }
        tempImgView.contentMode = UIViewContentMode.Center
        return tempImgView;
    }
    
    class func get25kgImgView () -> UIImageView {
        let imgView = UIImageView(image: UIImage(named: "25kg_front"));
        return imgView;
    }
    
    class func get20kgImgView () -> UIImageView {
        let imgView = UIImageView(image: UIImage(named: "20kg_front"));
        return imgView;
    }
    
    class func get15kgImgView () -> UIImageView {
        let imgView = UIImageView(image: UIImage(named: "15kg_front"));
        return imgView;
    }
    
    class func get10kgImgView () -> UIImageView {
        let imgView = UIImageView(image: UIImage(named: "10kg_front"));
        return imgView;
    }
    
    class func get5kgImgView () -> UIImageView {
        let imgView = UIImageView(image: UIImage(named: "5kg_front"));
        return imgView;
    }
    
    class func get2_5kgImgView () -> UIImageView {
        let imgView = UIImageView(image: UIImage(named: "2.5kg_front"));
        return imgView;
    }
    
    class func get1_25kgImgView () -> UIImageView {
        let imgView = UIImageView(image: UIImage(named: "1.25kg_front"));
        return imgView;
    }
    
    class func get0_5kgImgView () -> UIImageView {
        let imgView = UIImageView(image: UIImage(named: "0.5kg_front"));
        return imgView;
    }
    
    class func get0_25kgImgView () -> UIImageView {
        let imgView = UIImageView(image: UIImage(named: "0.25kg_front"));
        return imgView;
    }
}