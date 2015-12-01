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
    var tField: UITextField!
    var mainBeaconName = ""
    let emptyImageView = UIImageView(frame: CGRectMake(20, 20, 400, 400));
    //let imageEmpty = UIImage(named: "noBeacon.png")
    //let imageEmpty = UIImage(named: "emptyState1.png");
    //let imageEmpty = UIImage(named: "emptyState2.png");
    let imageEmpty = UIImage(named: "emptyState3.png");
    //let imageEmpty = UIImage(named: "emptyState4.png");
    //let imageEmpty = UIImage(named: "emptyState8.png");
    var i = 0;
    
    let oneImageView = UIImageView(frame: CGRectMake(20, 20, 250, 250));
    let imageOne = UIImage(named: "oneBeacon.png")
    
    var numberOfCellsPresent = 0;
    
    // create a new style
    var style = ToastStyle()
    

    
    //var indicator = UIActivityIndicatorView(activityIndicatorStyle: .White)
    
//    var minor = 0
    
    
//    @IBOutlet var whiteBackground: UILabel!
    
    
    // Initialise the PFQueryTable tableview
    override init(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
        //self.tableView.separatorStyle = .None
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //UIApplication.sharedApplication().statusBarStyle = .LightContent
        print("yoooo");
        //self.view.makeToast("This is a piece of toast")
        self.tableView.separatorStyle = .None
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: 0x55708d)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.tableView.backgroundColor = UIColor(hex: 0x55708d) 
        
        self.tableView.rowHeight = 75.0
        
        self.navigationController?.navigationBarHidden = false
        self.tableView.separatorStyle = .None
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
        self.tableView.separatorStyle = .None
        self.refreshControl?.tintColor = UIColor.whiteColor()
        
        self.refreshControl?.addTarget(self, action: "onPullToFresh", forControlEvents: UIControlEvents.ValueChanged)
        //UIProgressView.appearance().progressTintColor = UIColor.whiteColor();
        //self.progress. = UIColor.yellowColor()
        

        
        emptyImageView.frame.origin.x = (self.view.bounds.size.width - emptyImageView.frame.size.width) / 2.0;
        emptyImageView.frame.origin.y = (self.view.bounds.size.height - emptyImageView.frame.size.height) / 4.0;
        //        emptyImageEmpty.frame.origin.x = (self.view.bounds.size.width - emptyImageView.frame.size.width) / 2.0 // centered left to right.
        emptyImageView.image = imageEmpty
        self.tableView.addSubview(emptyImageView)
        //emptyImageView.hidden = true;
        
        oneImageView.frame.origin.x = (self.view.bounds.size.width - oneImageView.frame.size.width) / 2.0;
        oneImageView.frame.origin.y = (self.view.bounds.size.height - oneImageView.frame.size.height) / 4.0;
        //        emptyImageEmpty.frame.origin.x = (self.view.bounds.size.width - emptyImageView.frame.size.width) / 2.0 // centered left to right.
        oneImageView.image = imageOne
        self.tableView.addSubview(oneImageView)
        //oneImageView.hidden = true;
        
        print("this is on load");
        //print(tableView.indexPathsForVisibleRows!.count)
        
//        if(tableView.indexPathsForVisibleRows!.count > 0){
//            emptyImageView.hidden = true
//        }
//        else{
//            emptyImageView.hidden = false
//        }
        
        // this is just one of many toast style options
        style.backgroundColor = UIColor(hex: 0x18beae)
        
        let error: NSErrorPointer = nil
        let count = queryForTable().countObjects(error)
        print(count)
        if (count > 0) {
            emptyImageView.hidden = true;
            oneImageView.hidden = true;
            if( count == 1){
                oneImageView.hidden = false;
            }
        }
        else{
            oneImageView.hidden = true;
            emptyImageView.hidden = false;
            self.view.makeToast("Grab a beacon and pull to refresh", duration: 1.5, position: CGPoint(x: self.view.bounds.size.width / 2.0, y: 560.0), style: style)
        }

        print("!!!!this is on load");


        
        
        
    }
    
    func onPullToFresh(){
        print("1111WARRAUPPP")
        style.backgroundColor = UIColor(hex: 0x18beae)
        let error: NSErrorPointer = nil
        let count = queryForTable().countObjects(error)
        print(count)
        if(count - numberOfCellsPresent == 1){
            self.view.makeToast("Awesome! Beacon was detected :)", duration: 1.5, position: CGPoint(x: self.view.bounds.size.width / 2.0, y: 560.0))
            numberOfCellsPresent++
        }
        if (count > 0) {
            emptyImageView.hidden = true;
            oneImageView.hidden = true;
            if( count == 1){
                oneImageView.hidden = false;
            }
        }
        else{
            oneImageView.hidden = true;
            emptyImageView.hidden = false;
            self.view.makeToast("Grab a beacon and pull to refresh", duration: 1.5, position: CGPoint(x: self.view.bounds.size.width / 2.0, y: 560.0), style : style)
        }
        
        //self.tableView.makeToast("Hiiiiii");
        print("2222WAAARAAAAP!!!");
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
        //self.textKey = "nameEnglish"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false

    }

    // Define the query that will provide the data for the table view
    override func queryForTable() -> PFQuery {
        let query = PFQuery(className: "ExampleData")
        //query.
        query.orderByDescending("updatedAt")
        return query
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell {
        
        print("WHAT IS THISSSS? HOW MANY ROWS DO WE HAVE ???");
        //        if (self.tableView.visibleCells.count) > 0 {
        //            emptyImageView.hidden = true;
        //        }
        print(tableView.indexPathsForVisibleRows!.count)
        if(tableView.indexPathsForVisibleRows!.count > 0){
        //    emptyImageView.hidden = true;
        }
        //print(tableView.indexPathForCell(<#T##cell: UITableViewCell##UITableViewCell#>)
        //(tableData[indexPath.row])
        print("GOOOODDD !!!");
        
        self.tableView.separatorStyle = .None
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! PFTableViewCell!
        if cell == nil {
            cell = PFTableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        }
        

        
        
        //adds white background to cell
        let imageView_Background = UIImageView(frame: CGRectMake(10, 10, cell.frame.width + 30, cell.frame.height + 10))
        let image_Background = UIImage(named: "cellBackground.jpg")
        imageView_Background.image = image_Background
        cell.backgroundView = UIView()
        cell.backgroundView!.addSubview(imageView_Background)
        
        // Extract values from the PFObject to display in the table cell
        let minorID = object?["minor"]
        let majorID = object?["major"]
        cell?.textLabel?.text = "Beacon ID : " + String(minorID!) + "-" + String(majorID!)
        mainBeaconName = (cell?.textLabel?.text)!;
        
        if let mentorStatus = object?["status"] as? String {
            cell?.detailTextLabel?.text = mentorStatus
            cell?.detailTextLabel?.backgroundColor = UIColor.whiteColor();
            //if the beacon is active, display under which menetor the beacon is active
            if mentorStatus == "Active" {
                let currentBeaconName = object?["mainBeaconName"];
                print(currentBeaconName);
                print("OMFG I NEED THIS TO WORK!!!!!");
                cell?.textLabel?.text = String(currentBeaconName!);
            }
            else {
                print("let's see what's in the inactive");
                object?["mainBeaconName"] = "Beacon ID : " + String(minorID!) + "-" + String(majorID!)
                object!.saveInBackground()
            }
        }
        
        self.tableView.separatorStyle = .None
        print("gna gna gna");
        
        return cell
    }
    
    

    
    override func viewDidAppear(animated: Bool) {
        //print("4");
//        var query = PFQuery(className:"ExampleData")
//        query.whereKey("objectId", equalTo:PFUser.currentUser()!.objectId)
        // Refresh the table to ensure any data changes are displayed
        //tableView.reloadData()
        //UIProgressView.appearance().progressTintColor = UIColor.whiteColor()
        
        self.tableView.separatorStyle = .None
        //print(numberOfSectionsInTableView(self.tableView))
        print("this is on appear");
        print(tableView.indexPathsForVisibleRows!.count)
        print("???this is on load");
        if(tableView.indexPathsForVisibleRows!.count > 0){
        //    emptyImageView.hidden = true;
        }
        else {
        //    emptyImageView.hidden = false;
        }
        print("BLEHHH");
 
        
    }
    
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("HEEEEYYY THIS IS HAPPENING!!!");
//        print(numberOfSectionsInTableView(tableView));
//            return 0;
//        
////        if self.numberOfRow == 0{
////            var emptyLabel = UILabel(frame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height))
////            emptyLabel.text = "No Data"
////            
////            self.tableView.backgroundView = emptyLabel
////            self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
////            return 0
////        } else {
////            return self.numberOfRow
////        }
//    }
    
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
    




    

    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath ) {

        cell.backgroundColor = UIColor(hex: 0x55708d)
        self.tableView.separatorStyle = .None
          //cell.backgroundColor = UIColor.whiteColor()
        
        print("11WHAT IS THISSSS? HOW MANY ROWS DO WE HAVE ???");
        //        if (self.tableView.visibleCells.count) > 0 {
        //            emptyImageView.hidden = true;
        //        }
//        print(tableView.indexPathsForVisibleRows!.count)
//        if(tableView.indexPathsForVisibleRows!.count > 0){
//            emptyImageView.hidden = true;
//        }
        //print(tableView.indexPathForCell(<#T##cell: UITableViewCell##UITableViewCell#>)
        //(tableData[indexPath.row])
        //print(cell.isFirstResponder());
//        print(indexPath.length);
        //print(tableView.
//        emptyImageView.hidden = true;
//        print(cell.editing)
//        print(tableView.indexPathsForVisibleRows!.count)
//        do {
//            queryForTable().countObjects(error: )
//            print(messages);
//        } catch _ {
//            print("Error ocqurence when obtain other user list")
//        }
//        if( queryForTable().countObjects(NSError) == 0 ){
//        
//        }
//        let error: NSErrorPointer = nil
//        let count = queryForTable().countObjects(error)
//        print(count)
//
//        print(i++);
        print("1111GOOOODDD !!!");


    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //CODE TO BE RUN ON CELL TOUCH
//        let alertController = UIAlertController(title: "iOScreator", message:
//            "Hello, world!", preferredStyle: UIAlertControllerStyle.Alert)
//        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default,handler: nil))
        self.tableView.separatorStyle = .None
        var userIsConnected = false;

        //select cell
        let cell = tableView.cellForRowAtIndexPath(tableView.indexPathForSelectedRow!)
        
        let mentorID = cell?.textLabel?.text!;
        let mentorStatus = cell?.detailTextLabel?.text;
        
        //Create alert pop-up
        let alertController = UIAlertController(title: mentorID , message: mentorStatus , preferredStyle: .Alert)
        
        //Add Cancel button
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }
        
        //Add Save button
        let saveAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            NSLog("Save Pressed")
    
            
            print("we are extracting the beacon id...");
            //var currentBeaconName = ((cell?.textLabel?.text!)!).stringByReplacingOccurrencesOfString("Beacon ID : ", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
            
            var currentBeaconName = ((cell?.textLabel?.text!)!)

            
            //var currentBeaconName = object["mainBeaconName"]
            //print("this is magic")
            
            print("this is initially the name of the beacon...");
            print(currentBeaconName)
            
            var messages = NSArray()
            var fuckingObjectID = "hey"
            
            //print("MAKE IT WORK!!")
            //print("This is the current beacon name " + currentBeaconName)
//            print(self.tField.text!)
//            var query = PFQuery(className: "ExampleData")
//            query.whereKey("mainBeaconName", equalTo: currentBeaconName)
//            query.findObjectsInBackgroundWithBlock { (object, error) -> Void in
//                if error == nil {
//                    print("CAN YOU F WORK");
//                    print(object)
//                }
//                else {
//                    print(error)
//                }
//                
//            }
            
            let query = PFQuery(className: "ExampleData")
            query.whereKey("mainBeaconName", equalTo: currentBeaconName)
            do {
                messages = try query.findObjects()
                //print(messages);
            } catch _ {
                print("Error ocqurence when obtain other user list")
            }

            for message in messages {
                //print(message.objectId!! as String)
                fuckingObjectID = message.objectId!! as String
            }
//            query.cancel()
////            print
//            
//            print(self.tField.text)
            //print("plz...")
            //print(fuckingObjectID)
            var query2 = PFQuery(className:"ExampleData")
            query2.getObjectInBackgroundWithId(fuckingObjectID) {
                (object, error) -> Void in
                if error != nil {
                    print(error)
                } else {
                    if let object = object {
                        object["mainBeaconName"] = self.tField.text!
                    }
                    object!.saveInBackground()
                }
            }
            
            currentBeaconName = self.tField.text!
            print("this is the new name of the beacon now...");
            print(currentBeaconName);
            //cell?.textLabel?.text = "Beacon ID : " + currentBeaconName;
            
            cell?.textLabel?.text = currentBeaconName;
            
            
            
//            var objID = ""
//            
//            var query2 = PFQuery(className:"ExampleData")
//            query2.whereKey("mainBeaconName", equalTo:currentBeaconName)
//            
//
//            do {
//                var obj = try query2.findObjects()
////                print(obj)
//                
//            } catch _ {
//                print("Error ocqurence when obtain other user list")
//            }
            
            
//            do {
//            var objects = try query2.findObjects()
//                        } catch _ {
//                            MessageAlert.errorAlert("Error ocqurence when obtain other user list")
//                        }
//            print(objects)
//            print(query2["capital"]);
//            query2.findObjects() as! [PFObject]
//            query2.findObjectsInBackgroundWithBlock {
//                (objects: [PFObject]?, error: NSError?) -> Void in
//                
//                
//                if (error == nil && objects != nil){
////                    completion(result: objects!);
//                    print(objects)
//                    for object in objects! {
//                        objID = object.objectId!
//                        print("fuck!");
//                        print(object.objectId!)
//                        print("you!");
//                        print(objID)
//                        print("thanks!");
//                    }
////                    print(objects![4])
//                }
//
//            }
            
//            sleep(5);
//            
//            print("cacaolait!!!")
////            print(objID);
//            var query = PFQuery(className:"ExampleData")
//            query.getObjectInBackgroundWithId(objID) {
////                (gameScore: PFObject?, error: NSError?) -> Void in
////                if error == nil && gameScore != nil {
////                    print(gameScore)
////                } else {
////                    print(error)
////                }
//                (rowObject: PFObject?, error: NSError?) -> Void in
//                if error != nil {
//                    print(error)
//                } else if let rowObject = rowObject {
//                    rowObject["nameLocal"] = "hihihi"
//                    rowObject["capital"] = "bleh"
//                    rowObject.saveInBackground()
//                }
//            }
            
            
        }

        
        //Rename
        let renameAction = UIAlertAction(title: "Rename", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            NSLog("Rename Pressed")
            
            let alert = UIAlertController(title: cell?.textLabel?.text!, message: "is renamed to:", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addTextFieldWithConfigurationHandler(self.configurationTextField)
            
            alert.addAction(saveAction);
            alert.addAction(cancelAction);
            
            self.presentViewController(alert, animated: true, completion: {
                print("completion block")
            })
            
        }
        
        
        
                if (mentorStatus == "Active"){
                    userIsConnected = true;
                }
                else {
                    userIsConnected = false;
                }
        
        
        if (userIsConnected){
            
            
            var disConnectAction = UIAlertAction(title: "Disconnect", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                NSLog("Disconnect Pressed")
                userIsConnected = false;
                
                
                var currentBeaconName = ((cell?.textLabel?.text!)!).stringByReplacingOccurrencesOfString("Beacon ID : ", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                print("OK LETS SEE WHAT THIS IS NOW!")
                print(currentBeaconName)
                
                var messages = NSArray()
                var fuckingObjectID = "hey"
                
                print("MAKE IT WORK!!")
                //print(self.tField.text!)
                //            var query = PFQuery(className: "ExampleData")
                //            query.whereKey("mainBeaconName", equalTo: currentBeaconName)
                //            query.findObjectsInBackgroundWithBlock { (object, error) -> Void in
                //                if error == nil {
                //                    print("CAN YOU F WORK");
                //                    print(object)
                //                }
                //                else {
                //                    print(error)
                //                }
                //
                //            }
                var query = PFQuery(className: "ExampleData")
                query.whereKey("mainBeaconName", equalTo: currentBeaconName)
                do {
                    messages = try query.findObjects()
                    print(messages);
                } catch _ {
                    print("Error ocqurence when obtain other user list")
                }
                
                for message in messages {
                    print(message.objectId!! as String)
                    fuckingObjectID = message.objectId!! as String
                }
                //            query.cancel()
                ////            print
                //
                //            print(self.tField.text)
                print("plz...")
                print("OKAY THIS IS THE SECOND TIME WE GET THE PROPER KEY!")
                print(fuckingObjectID)
                var query2 = PFQuery(className:"ExampleData")
                query2.getObjectInBackgroundWithId(fuckingObjectID) {
                    (object, error) -> Void in
                    if error != nil {
                        print(error)
                    } else {
                        if let object = object {
                            object["status"] = "Inactive"
//                            let minorID = object["minor"]
//                            let majorID = object["major"]
//                            object["mainBeaconName"] = "Beacon ID : " + String(minorID!) + "-" + String(majorID!)
                        }
                        object!.saveInBackground()
                    }
                }
                
                //            currentBeaconName = self.tField.text!
                cell?.detailTextLabel?.text = "Inactive"
                
                
                
                
                
                
                
                
                
            }
            
            alertController.addAction(disConnectAction)
            
            
        }

        else {
        
        
            var connectAction = UIAlertAction(title: "Connect", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                NSLog("Connect Pressed")
                userIsConnected = true;
                
                
                var currentBeaconName = ((cell?.textLabel?.text!)!).stringByReplacingOccurrencesOfString("Beacon ID : ", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                print("OK LETS SEE WHAT THIS IS NOW!")
                print(currentBeaconName)
                
                var messages = NSArray()
                var fuckingObjectID = "hey"
                
                print("MAKE IT WORK!!")
                //print(self.tField.text!)
                //            var query = PFQuery(className: "ExampleData")
                //            query.whereKey("mainBeaconName", equalTo: currentBeaconName)
                //            query.findObjectsInBackgroundWithBlock { (object, error) -> Void in
                //                if error == nil {
                //                    print("CAN YOU F WORK");
                //                    print(object)
                //                }
                //                else {
                //                    print(error)
                //                }
                //
                //            }
                var query = PFQuery(className: "ExampleData")
                query.whereKey("mainBeaconName", equalTo: currentBeaconName)
                do {
                    messages = try query.findObjects()
                    print(messages);
                } catch _ {
                    print("Error ocqurence when obtain other user list")
                }
                
                for message in messages {
                    print(message.objectId!! as String)
                    fuckingObjectID = message.objectId!! as String
                }
                //            query.cancel()
                ////            print
                //
                //            print(self.tField.text)
                print("plz...")
                print("OKAY THIS IS THE SECOND TIME WE GET THE PROPER KEY!")
                print(fuckingObjectID)
                var query2 = PFQuery(className:"ExampleData")
                query2.getObjectInBackgroundWithId(fuckingObjectID) {
                    (object, error) -> Void in
                    if error != nil {
                        print(error)
                    } else {
                        if let object = object {
                            object["status"] = "Active"
                        }
                        object!.saveInBackground()
                    }
                }
                
    //            currentBeaconName = self.tField.text!
                cell?.detailTextLabel?.text = "Active"
                
                
                
                
                
                
                
                
                
            }
        
            alertController.addAction(connectAction)
        }
        
 
        
        // Add the actions
        alertController.addAction(renameAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        self.tableView.separatorStyle = .None
        
        
        print("22WHAT IS THISSSS? HOW MANY ROWS DO WE HAVE ???");
        //        if (self.tableView.visibleCells.count) > 0 {
        //            emptyImageView.hidden = true;
        //        }
        print(tableView.indexPathsForVisibleRows!.count)
        //        if(tableView.indexPathsForVisibleRows!.count > 0){
        //            emptyImageView.hidden = true;
        //        }
        //print(tableView.indexPathForCell(<#T##cell: UITableViewCell##UITableViewCell#>)
        //(tableData[indexPath.row])
        print("22GOOOODDD !!!");
    }
    
    
    
    
    

    
    func configurationTextField(textField: UITextField!)
    {
        print("generating the TextField")
        textField.placeholder = "Enter person of interest name"
        print("I WOULD LOVE TO BE HEALTHY");
        print(textField.text!);
        tField = textField
    }
    
    //find objectID of given element
    func findObjID(ofThisElement: String, inThisColumn: String, fromThisDB: String ) -> String{
        
        var objID = ""
        
        var query = PFQuery(className: fromThisDB)
        query.whereKey(inThisColumn, equalTo: ofThisElement)
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            if (error == nil && objects != nil){
                for object in objects! {
                    objID = object.objectId!
                }
            }
        }
        
        return objID;
    }
    
    func editValue(fromThisObjID: String, fromThisColumn: String, withThisText: String){
        var query = PFQuery(className:"ExampleData")
        query.getObjectInBackgroundWithId(fromThisObjID) {
            //                (gameScore: PFObject?, error: NSError?) -> Void in
            //                if error == nil && gameScore != nil {
            //                    print(gameScore)
            //                } else {
            //                    print(error)
            //                }
            (rowObject: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
            } else if let rowObject = rowObject {
                rowObject[fromThisColumn] = withThisText
//                rowObject["capital"] = "yolooo"
                rowObject.saveInBackground()
            }
        }
    }
    
    static func obtainFriendsList( roomData : [PFObject] ) {
        let query = PFQuery(className: "PeopleInRoom")
        query.whereKey("room", containedIn: roomData)
        query.includeKey("people")
        query.includeKey("room")
        do {
            var hello = try query.findObjects()
        } catch _ {
            print("Error ocqurence when obtain other user list")
        }
    }

    
}