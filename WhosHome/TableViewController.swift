//
//  TableViewController.swift
//  WhosHome
//
//  Created by Dan Crisan on 2015-11-08.
//  Copyright © 2015 davik. All rights reserved.
//

import Foundation
import Parse
import UIKit

class TableViewController: PFQueryTableViewController, ESTBeaconManagerDelegate {

    let beaconManager = ESTBeaconManager()
    let beacon = ESTBeacon()
    var someInts = [Int]()
//    var minor = 0
    
    // Initialise the PFQueryTable tableview
    override init(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beaconManager.delegate = self
        let proxID = NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")
        beaconManager.startEstimoteBeaconsDiscoveryForRegion(ESTBeaconRegion(proximityUUID: proxID!, identifier: "Vik's Beacons"))
        
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
        
        
        //        print(isBeacon(beacon_C));
        //        print(beacon_C.major);
       
        //        print(beacon.proximityUUID!.UUIDString)
//        var gameScoreObject = PFObject(className:"ExampleData")
//        var query = PFQuery(className:"ExampleData")
//        query.getObjectInBackgroundWithId("765765") {
//            (ExampleData: PFObject?, error: NSError?) -> Void in
//            if error == nil && ExampleData != nil {
//                print("yee!")
//                print(ExampleData)
//            } else {
//                print("!fuck")
//                print(error)
//            }
//        }
    }
    
    func beaconManager(manager: ESTBeaconManager!, didDiscoverBeacons beacons: [AnyObject]!, inRegion region: ESTBeaconRegion!) {
        //var gameScoreObject = PFObject(className:"ExampleData")
        //var query = PFQuery(className:"ExampleData")
        
//        print(query.valueForKey("major"))
        for beacon in beacons
        {
            //print(beacon.proximityUUID.UUIDString)
            
//            query.whereKey(String((beacon.major!)!), containedIn: gameScoreObject["major"] as! [AnyObject])
//            query.findObjectsInBackgroundWithBlock {
//                (objects: [AnyObject]?, error: NSError?) -> Void in
//                
//                if error == nil {
//                    print("NO ERROR");
////                    if (objects!.count > 0) {
////                        isPresent = true;
////                    }
//                    
//                } else {
//                    // Log details of the failure
//                    println("Error: \(error) \(error!.userInfo!)")
//                }
//                
////                completion(isUser: isPresent);
//            }

//            print(someInts.contains(minor));
//            if !someInts.contains(minor)
//            {
//                
////                someInts.append(minor)
//                
//                gameScoreObject["major"] = minor
//                //            gameScore["playerName"] = "Sean Plott"
//                //            gameScore["cheatMode"] = false
//                gameScoreObject.saveInBackgroundWithBlock {
//                    (success: Bool, error: NSError?) -> Void in
//                    if (success) {
//                        // The object has been saved.
//                    } else {
//                        // There was a problem, check error.description
//                    }
//                }
//
//            }
            
            
            
            
            
            
            
            print(String((beacon.major!)!));
            print(beacon.measuredPower);
        }
    }


    
    required init!(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Configure the PFQueryTableView
        self.parseClassName = "ExampleData"
        self.textKey = "nameEnglish"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }

    // Define the query that will provide the data for the table view
    override func queryForTable() -> PFQuery {
        var query = PFQuery(className: "ExampleData")
//        query.orderByAscending("nameEnglish")
//        print("2");
        return query
        
    }
    
    //override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! PFTableViewCell!
        if cell == nil {
//            cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        
        // Extract values from the PFObject to display in the table cell
        if let nameEnglish = object?["nameEnglish"] as? String {
//            cell?.textLabel?.text = nameEnglish
        }
        if let capital = object?["capital"] as? String {
//            cell?.detailTextLabel?.text = capital
        }
        print("1");
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        print("4");
//        var query = PFQuery(className:"ExampleData")
//        query.whereKey("objectId", equalTo:PFUser.currentUser()!.objectId)
        // Refresh the table to ensure any data changes are displayed
//        tableView.reloadData()
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        // Get the new view controller using [segue destinationViewController].
//        var detailScene = segue.destinationViewController as! MainWindow

//        navigationItem.title = nil
//        navigationItem.backBarButtonItem
//         self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Bob", style: .Plain, target: nil, action: nil)
//        navigationItem.backBarButtonItem = true
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
//    }


    
}