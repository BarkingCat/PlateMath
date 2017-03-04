//
//  BarWeights.swift
//  Credila
//
//  Created by Rakesh B SablePatil on 24/04/16.
//  Copyright © 2016 CSNS. All rights reserved.
//

import Foundation

public class BarWeightsHelper {
    class func getAllBarWeights () -> NSArray {
        let barWeightsArr = [
            "30 kg - Safety Squat Bar",
            "25 kg - Buffalo Bar",
            "20 kg - 2.2 m Olympic Bar",
            "20 kg - Cambered Bar",
            "20 kg - Trap Bar",
            "15 kg - 1.8 m Olympic Bar",
            "15 kg - Swiss Bar",
            "11 kg - 1.5 m Olympic Bar",
            "11 kg - EZ Curl Bar"
        ];
        
        return barWeightsArr;
    }
    
    class func getAllBarWeightsValues () -> NSArray {
        let barWeightsValArr = [ 30, 25, 20, 20, 20, 15, 15, 11, 11 ];
        
        return barWeightsValArr;
    }
}