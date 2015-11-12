//
//  MainWindow.swift
//  WhosHome
//
//  Created by Dan Crisan on 2015-11-08.
//  Copyright © 2015 davik. All rights reserved.
//

import UIKit

class MainWindow: UIViewController {
    
//    let beaconManager = ESTBeaconManager()
//    let beacon = ESTBeacon()
//    let beacon_C = CLBeacon()
    @IBAction func bringListOfBeacons(sender: AnyObject) {
//        performSegueWithIdentifier("goToListOfBeacons", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.navigationBarHidden = true
//        beaconManager.delegate = self
//        let proxID = NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")
//        beaconManager.startEstimoteBeaconsDiscoveryForRegion(ESTBeaconRegion(proximityUUID: proxID!, identifier: "Vik's Beacons"))
//        //        print(isBeacon(beacon_C));
//        //        print(beacon_C.major);
//        print(beacon.major);
        //        print(beacon.proximityUUID!.UUIDString)
    }
    
//    func beaconManager(manager: ESTBeaconManager!, didDiscoverBeacons beacons: [AnyObject]!, inRegion region: ESTBeaconRegion!) {
//        for beacon in beacons
//        {
//            //print(beacon.proximityUUID.UUIDString)
//            print((beacon.major!)!);
//        }
//    }
    
    //    func isBeacon(beacon_B: CLBeacon) -> Bool {
    ////        return beacon.proximityUUID.UUIDString == UUIDString && beacon.major.unsignedShortValue == major && beacon.minor.unsignedShortValue == minor
    //        return((beacon_B.proximityUUID == NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")));
    //        
    //    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }
    
}

