//
//  CollarWeights.swift
//  Credila
//
//  Created by Rakesh B SablePatil on 24/04/16.
//  Copyright © 2016 CSNS. All rights reserved.
//

import Foundation

public class CollarWeightsHelper {
    class func getAllCollarWeights () -> NSArray {
        let collarWeightsArr = [
            "No Collars",
            "2 @ 0.25 kg = 0.5 kg Spring Collars",
            "2 @ 0.5 kg = 1 kg Clamp Collars",
            "2 @ 2.5 kg = 5 kg Standard Collars"
        ];
        
        return collarWeightsArr;
    }
    
    class func getAllCollarWeightsValues () -> NSArray {
        let collarWeightsValArr = [ 0, 0.5, 1, 5 ];
        
        return collarWeightsValArr;
    }
}