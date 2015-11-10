//
//  ListViewController.swift
//  WhosHome
//
//  Created by Vik Denic on 1/4/15.
//  Copyright (c) 2015 davik. All rights reserved.
//
import UIKit

class ListViewController: UIViewController, ESTBeaconManagerDelegate {

    let beaconManager = ESTBeaconManager()
    let beacon = ESTBeacon()
    let beacon_C = CLBeacon()

    override func viewDidLoad() {
        super.viewDidLoad()
        beaconManager.delegate = self
        let proxID = NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")
        beaconManager.startEstimoteBeaconsDiscoveryForRegion(ESTBeaconRegion(proximityUUID: proxID!, identifier: "Vik's Beacons"))
//        print(isBeacon(beacon_C));
//        print(beacon_C.major);
        print(beacon.major);
//        print(beacon.proximityUUID!.UUIDString)
    }

    func beaconManager(manager: ESTBeaconManager!, didDiscoverBeacons beacons: [AnyObject]!, inRegion region: ESTBeaconRegion!) {
        for beacon in beacons
        {
            //print(beacon.proximityUUID.UUIDString)
            print((beacon.major!)!);
        }
    }
    
//    func isBeacon(beacon_B: CLBeacon) -> Bool {
////        return beacon.proximityUUID.UUIDString == UUIDString && beacon.major.unsignedShortValue == major && beacon.minor.unsignedShortValue == minor
//        return((beacon_B.proximityUUID == NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")));
//        
//    }
}
