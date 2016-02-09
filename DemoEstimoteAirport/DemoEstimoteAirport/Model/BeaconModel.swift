//
//  BeaconModel.swift
//  DemoEstimoteAirport
//
//  Created by Solute Labs on 05/02/16.
//  Copyright © 2016 Solute Labs. All rights reserved.
//

import UIKit
import SwiftyJSON

/*var vehicle_active: Bool?
var vehicle_image_url: NSURL?
var speed_limit: Double?
var age_minutes: Double?
var speed_icon: String?
var company_name: String?
var avg_speed: Double?
var time_zone_adjustment: String?
var vin: String?
var duty_status: String?
var speed_label: String?
var inst_speed: Double?
var label: String?
var phone_number: Int?
var exec_time_utc: NSDate?
var driver_active: Bool?
var ignition: String?
var max_speed: Double?

var location: CLLocation?
weak var gsmMarker: GMSMarker?

var driver: DriverDM?

init (vehicle: JSON) {
super.init()
self.driver = DriverDM(driver: nil)
self.update(vehicle: vehicle)
}

func update(vehicle vehicle: JSON) -> Void {
self.vehicle_active = boolValue(value: vehicle["vehicle_active"].stringValue)
self.vehicle_image_url = vehicle["vehicle_image_url"].URL
self.speed_limit = vehicle["speed_limit"].doubleValue
self.age_minutes = vehicle["age_minutes"].doubleValue
self.speed_icon = vehicle["speed_icon"].stringValue
self.company_name = vehicle["company_name"].stringValue
self.avg_speed = vehicle["avg_speed"].doubleValue
self.time_zone_adjustment = vehicle["time_zone_adjustment"].stringValue
self.vin = vehicle["vin"].stringValue
self.duty_status = vehicle["duty_status"].stringValue
self.speed_label =*/
class BeaconModel: NSObject {
    var uuid: NSUUID?
    var major: NSNumber?
    var minor: NSNumber?
    var proximity: CLProximity?
    var rssi: Int?
    
    init(beacon : CLBeacon) {
        super.init()
        self.setModel(beacon)
        AvailableBeaconsArrayModel.sharedInstance = AvailableBeaconsArrayModel.init(beacon: self)
    }
    
    func setModel(beacon : CLBeacon) {
        self.uuid = beacon.proximityUUID
        self.major = beacon.major
        self.minor = beacon.minor
        self.proximity = beacon.proximity
        self.rssi = beacon.rssi
    }

}
