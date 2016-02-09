//
//  BeaconListViewController.swift
//  DemoEstimoteAirport
//
//  Created by Solute Labs on 03/02/16.
//  Copyright © 2016 Solute Labs. All rights reserved.
//

import UIKit
import SnapKit

class BeaconListViewController: UIViewController, ESTBeaconManagerDelegate {
    
    var tableView = UITableView()
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
    var availableBeacons = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.tableView)

        self.tableView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view)
        }
        
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
//            print(beacons)
//            if let nearestBeacon = beacons.first {
//                let beaconProximity = nearestBeacon.proximity.rawValue
//                let places = placesNearBeacon(nearestBeacon)
//                // TODO: update the UI here
//                print("Proximity - \(beaconProximity) & places - \(places)") // TODO: remove after implementing the UI
//            }
            
            if beacons.count > 0 {
                for item in beacons {
//                    if self.availableBeacons.count > 0 {
//                        for beacon in self.availableBeacons {
                           let beconModel = BeaconModel.init(beacon: item )
                            
                            print(beconModel)
                    
//                        }
                    
                        
//                        if self.availableBeacons.containsObject(item) {
//                            // Do Nothing
//                        }
//                        else {
//                            self.availableBeacons.addObject(item)
//                        }
//                    }
//                    else {
//                        self.availableBeacons.addObject(item)
//                    }
                    
                }
//                print("BeaconArray - \(self.availableBeacons)")
                print("cout - \(AvailableBeaconsArrayModel.sharedInstance?.avlBeaconArray)")
            }
            
    }
}
