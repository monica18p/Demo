//
//  ViewController.swift
//  DemoEstimoteAirport
//
//  Created by Solute Labs on 18/01/16.
//  Copyright © 2016 Solute Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ESTBeaconManagerDelegate {
    
    //ICE:        5CEE5A0E-1703-886D-732A-1D942EE24D47 , major: 43544, minor: 28690
    //MINT:       B9407F30-F5F8-466E-AFF9-25556B57FE6D , major: 50143, minor: 56081
    //BLUEBERRY:  B9407F30-F5F8-466E-AFF9-25556B57FE6D , major: 35035, minor: 56246
    
    let placesByBeacons = [
        "43544:28690" : [
            "ICE":0,
            "Heavenly Sandwiches": 50,  // read as: it's 50 meters from
                                        // "Heavenly Sandwiches" to the beacon with
                                        // major 6574 and minor 54631
            "Green & Green Salads": 150,
            "Mini Panini": 325
        ],
        "50143:56081" : [
            "MINT":0,
            "Heavenly Sandwiches": 250,
            "Green & Green Salads": 100,
            "Mini Panini": 20
        ],
        "35035:56246" : [
            "BLUEBERRY":0,
            "Heavenly Sandwiches": 350,
            "Green & Green Salads": 500,
            "Mini Panini": 170
        ]
    ]
    
    let beaconManager = ESTBeaconManager()
    let beaconRegion = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!, identifier: "ranged region")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.beaconManager.delegate = self
        self.beaconManager.requestAlwaysAuthorization()
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.beaconManager.startRangingBeaconsInRegion(self.beaconRegion)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.beaconManager.stopRangingBeaconsInRegion(self.beaconRegion)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    func placesNearBeacon(beacon: CLBeacon) -> [String] {
        let beaconKey = "\(beacon.major):\(beacon.minor)"
        if let places = self.placesByBeacons[beaconKey] {
            let sortedPlaces = Array(places).sort({ (obj1, obj2) -> Bool in
                return obj1.1 < obj2.1
            }).map({ (item:(String, Int)) -> String in
                return item.0
            })
            
            return sortedPlaces
        }
        return []
    }
    
    func beaconManager(manager: AnyObject, didRangeBeacons beacons: [CLBeacon],
        inRegion region: CLBeaconRegion) {
            print(beacons)
            if let nearestBeacon = beacons.first {
                let beaconProximity = nearestBeacon.proximity.rawValue
                let places = placesNearBeacon(nearestBeacon)
                // TODO: update the UI here
                print("Proximity - \(beaconProximity) & places - \(places)") // TODO: remove after implementing the UI
            }
            
    }


}
