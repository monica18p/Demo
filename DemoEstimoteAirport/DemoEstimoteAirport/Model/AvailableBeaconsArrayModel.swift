//
//  AvailableBeaconsArrayModel.swift
//  DemoEstimoteAirport
//
//  Created by Solute Labs on 05/02/16.
//  Copyright © 2016 Solute Labs. All rights reserved.
//


//Create beacon array at once in beaconModel class and just replace the whole this class's object with that array.

import UIKit

class AvailableBeaconsArrayModel: NSObject {
    
    static var sharedInstance: AvailableBeaconsArrayModel?
    var avlBeaconArray = NSMutableArray()
    var avlBeaconMajorMinorDict = NSDictionary()
    var isBeaconPresent : Bool = false
    
    init?(beacon: BeaconModel) {
        super.init()
        let newMajorMinorDict = NSMutableDictionary()
        newMajorMinorDict.setValue(beacon.minor, forKey: "\(beacon.major)")
        
        if self.avlBeaconArray.count > 0 {
            for item in self.avlBeaconArray {
                let bcnModel = BeaconModel.init(beacon: item as! CLBeacon)
                let avlMajorMinorDict = NSMutableDictionary()
                avlMajorMinorDict.setValue(bcnModel.minor, forKey: "\(bcnModel.major)")
                
                if avlMajorMinorDict == newMajorMinorDict {
                    isBeaconPresent = true
                    return
                }
                
            }
            
            
//            if self.avlBeaconArray.containsObject(beacon) {
//                // Do Nothing
//            }
//            else {
//                //Add new available beacon
//                self.avlBeaconArray.addObject(beacon)
//            }
        }
//        else {
//            self.avlBeaconArray.addObject(beacon)
//        }
        
        if isBeaconPresent == false {
            self.avlBeaconArray.addObject(beacon)
        }
        
    }
    
}
